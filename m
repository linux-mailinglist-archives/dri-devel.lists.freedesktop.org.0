Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CD0B097C8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 01:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F8A10E8C6;
	Thu, 17 Jul 2025 23:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWM+hoAS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3B110E8CA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:29:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HFQ5SQ016095
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yk8ZQbvTxT7BmHTI3shXSuRXBzNfqW8sP85GeRsrZG4=; b=GWM+hoASvo7ObJhg
 vg2UIzEKhnjsAtFpJl9AnLXeaDnaNdXiIQcCZnUIBdDwDDS4LK9sYpBp7b/cudgU
 +ej+H5SO1NNs5LE+KiJaiGx9ILVx4I9lkwmpq1CHrWXT4asa3l+sXc4NQmDIJR/x
 FpRo9zYCTBmd+R1O5JIwkeCgxDZPv89WMuGbAbpmDP1g+PIY3hSR8GzmEqgeZRlE
 2imkpLHQfJ0efdBkgky1EI4cpOhvepAtvXnD3DIMhnZHb5vlauDqEebMdf5blXMF
 xhWUQvdLkGOpR1X2WY1gvxEd2WiEZtCKkyethRjtHxaTvsuAEUdRQQ7YsXloNCtB
 r8vVwA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc19vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:29:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-236725af87fso21334635ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752794939; x=1753399739;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yk8ZQbvTxT7BmHTI3shXSuRXBzNfqW8sP85GeRsrZG4=;
 b=C5pb1c/NQL1mwazXcds9Ajd+0H2W8rBs7diNg71VuEMWKSyuBkUIc2F+Myliqbol1X
 Z2vyBlMJh9C2T1oOSw5TTSZA1dlK4oxOrIrFpApcTVEJ9Bx7IP8Ad9EvKN/Pt8+/1VPG
 AMhvm5YI3ZR3Ap/pj5Esfkbp89V8SPnXSpaYRHxtfWfCIbqtI3YthFr7p72npdG9OKbC
 YORDBlmVVrvw2jxDrlzo4Legu5Rm4qtvkGHthAS8/HOcozgr7HlXVJ0KjyGVLkQodZ/f
 cdnu4hbit4/KJUoLAdx4OQ6/l7XbHUc0TQTeH4z1cVHa9iCQ21L/6nlVekHPgOT1BR06
 W+IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXidKHqfwUhNLVy4RWBA3vehk5FahTQWWQI6kSZ9AECktCHZ+TCx2mRUKlIcSxLnaVD+ICCTsIA+UU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHEICveCZn+c3srRf1EIcZJmcVXBpRawnW6QBor+f4tVVYGeIC
 MtSWeqjXFMyCRow1cgEJFq6HxtcHSYWYvJuyEvJ4/3gJWnQgQ25JpbITTw/pxTM0zDq36bXqx8q
 +//Cp9uIlzUcIkDcZhO67vVal5IDsHfv6YtNav+UY8KsqLg0K7mMVp1t3IHLyz8eR5s5mpuA=
X-Gm-Gg: ASbGnctkZe9TMuO9OaPVQvUEal8FB+cr1w+AkLk5s4QwspLD6bpJ+njqTNWZqANBrAl
 Ez5dFf0AOvVJy+WqbH0qGIuJ14YJlEoUMJPrwXEChmeUmOo7JGIL5ZCJixs3egXHtlB0aZobLBm
 UcDeXCRmjtVVMzqDOYiqM9M8x1cWgTd+z4p9SV/u3naELNNecQGFqLy+R3ekLjc197aDnwqzrZx
 wiXEgezrYBLxqaeZ9aF2z2xz1mNdLsYNq7pbkrIF0loLjqwT+fk/q1RC6GxHp1Veh8bEIwwkRRC
 C9RXEkN+Ovj4o3l48wbaOMX71YeuQ6dpBI6kW6/c6fqC3LDr4qeLBqpAbZRUF6i0sVk1vJgDyDl
 VrpxZIxkdEWQW2+cdZi1S+stT
X-Received: by 2002:a17:903:1b6c:b0:23c:7c59:c74e with SMTP id
 d9443c01a7336-23e3009a237mr78035925ad.0.1752794939340; 
 Thu, 17 Jul 2025 16:28:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2/wtLSRngXNJpEVZ5L8vSfgP4iso0u3Mny2/dw9uXkt5pphORQ+PIZTh/iAWgEgnwPfpTEA==
X-Received: by 2002:a17:903:1b6c:b0:23c:7c59:c74e with SMTP id
 d9443c01a7336-23e3009a237mr78035695ad.0.1752794938866; 
 Thu, 17 Jul 2025 16:28:58 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e3cb7sm2002195ad.17.2025.07.17.16.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 16:28:58 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:28:46 -0700
Subject: [PATCH v3 4/5] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752794927; l=9121;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=lan3Y5KBTR4cC/ZtMB5SWaedJPpSyDvP8y8bQq9zCvE=;
 b=03eVzWqFidZ25JCpT9tqz5QUjDSx8ROwLmP2YHgRtifUoqZFZLYxbfvtojjYFYbp6auumdoDV
 x1KCbFJSL3pB3unjE//ooy8DahduBmsIAsAICXBdlJl0Er/9xwN22r0
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=6879873c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iZctjB8Tiv542dVYzCoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mKKX0kW60n2Ll29iCCNz8JnFX_64Orn8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDIwNiBTYWx0ZWRfX3QRJDE07Wj0n
 LJyc6LOoNfCs0Pr4cSUA0SVfSwvCjuvAzVBCsQJu+ZdMbnP0yUMSzo5jDfDLWwp6ktEMlw9Xhth
 yyva/RESy3DL8A9160GqTWgQeeXJ+GUehQXTfLTmmvHjI6Q1VbP7L365Fgabj0/z/JhVK6XX041
 4evmJyCxBr7wKRpJo3Aa/xHHEKyFl2Fk/ivmyGLhEXuEsfBSayyCKI+l5EtYvQTJo2OpZCNoMhk
 AWDyhtztxBexiJZqvM7ibY2Q049KCcGxY5DnrxejUhD6Qu+hTdsBoU0BveOt62UvNb6mekHflM2
 ogpyHDPqZafkwNMps8Ya0G7UnOegYpK3O5zHTanUxKrufTJeSD/VPx5EJZfOAiD9UTZu9fXKRti
 9VsjgrNZ/8OTXduR7i+YESxfisNDnih6x19B2MmTneQP0+mYcS4sAGpTYZSrE4fzJ+Io1JIe
X-Proofpoint-GUID: mKKX0kW60n2Ll29iCCNz8JnFX_64Orn8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170206
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

On some chipsets such as qcom,sa8775p-dp, qcom,sm8650-dp and some more,
the display port controller can support more than one pixel stream
(multi-stream transport).

These chipsets can support up to 4 stream pixel clocks for display port
controller. To support MST on these platforms, add the appropriate
stream pixel clock bindings

Since this mode is not supported on all chipsets, add exception
rules and min/max items to clearly mark which chipsets support
only SST mode (single stream) and which ones support MST.

Note: On chipsets that do support MST, the number of streams supported
can vary between controllers. For example, SA8775P supports 4 MST
streams on mdss_dp0 but only 2 streams on mdss_dp1.

In addition, many chipsets depend on the "sm8350-dp" compatibility
string but not all (ex. SM6350) support MST. Because of these reasons,
the min/maxItem for MST-supported platforms is a range of 5-8.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 36 +++++++++++++++++++++-
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 10 ++++--
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  6 ++--
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  6 ++--
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  6 ++--
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
 6 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index d8d94f62c102..2893f097df82 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -58,20 +58,28 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 5
     items:
       - description: AHB clock to enable register access
       - description: Display Port AUX clock
       - description: Display Port Link clock
       - description: Link interface clock between DP and PHY
-      - description: Display Port Pixel clock
+      - description: Display Port stream 0 Pixel clock
+      - description: Display Port stream 1 Pixel clock
+      - description: Display Port stream 2 Pixel clock
+      - description: Display Port stream 3 Pixel clock
 
   clock-names:
+    minItems: 5
     items:
       - const: core_iface
       - const: core_aux
       - const: ctrl_link
       - const: ctrl_link_iface
       - const: stream_pixel
+      - const: stream_1_pixel
+      - const: stream_2_pixel
+      - const: stream_3_pixel
 
   phys:
     maxItems: 1
@@ -173,6 +181,32 @@ allOf:
       required:
         - "#sound-dai-cells"
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8775p-dp
+              - qcom,sc7280-dp
+              - qcom,sc8180x-dp
+              - qcom,sc8280xp-dp
+              - qcom,sc8280xp-edp
+              - qcom,sm8150-dp
+              - qcom,sm8350-dp
+              - qcom,sm8650-dp
+              - qcom,x1e80100-dp
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 8
+
+    else:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 2dc76a074da1..0af1e5cd1691 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -384,12 +384,18 @@ examples:
                      <&dispcc_dptx0_aux_clk>,
                      <&dispcc_dptx0_link_clk>,
                      <&dispcc_dptx0_link_intf_clk>,
-                     <&dispcc_dptx0_pixel0_clk>;
+                     <&dispcc_dptx0_pixel0_clk>,
+                     <&dispcc_dptx0_pixel1_clk>,
+                     <&dispcc_dptx0_pixel2_clk>,
+                     <&dispcc_dptx0_pixel3_clk>;
             clock-names = "core_iface",
                           "core_aux",
                           "ctrl_link",
                           "ctrl_link_iface",
-                          "stream_pixel";
+                          "stream_pixel",
+                          "stream_1_pixel",
+                          "stream_2_pixel",
+                          "stream_3_pixel";
 
             phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index eef5627133db..0a8bda583469 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -207,12 +207,14 @@ examples:
                      <&dispcc_disp_cc_mdss_dptx0_aux_clk>,
                      <&dispcc_disp_cc_mdss_dptx0_link_clk>,
                      <&dispcc_disp_cc_mdss_dptx0_link_intf_clk>,
-                     <&dispcc_disp_cc_mdss_dptx0_pixel0_clk>;
+                     <&dispcc_disp_cc_mdss_dptx0_pixel0_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_pixel1_clk>;
             clock-names = "core_iface",
                           "core_aux",
                           "ctrl_link",
                           "ctrl_link_iface",
-                          "stream_pixel";
+                          "stream_pixel",
+                          "stream_1_pixel";
 
             phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 9e52ac9c0eb4..f8fffc168a71 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -378,12 +378,14 @@ examples:
                      <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
                      <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
                      <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
-                     <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+                     <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+                     <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
             clock-names = "core_iface",
                           "core_aux",
                           "ctrl_link",
                           "ctrl_link_iface",
-                          "stream_pixel";
+                          "stream_pixel",
+                          "stream_1_pixel";
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index 0858dd61fb0f..0bc0edc41341 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -401,12 +401,14 @@ examples:
                          <&disp_cc_mdss_dptx0_aux_clk>,
                          <&disp_cc_mdss_dptx0_link_clk>,
                          <&disp_cc_mdss_dptx0_link_intf_clk>,
-                         <&disp_cc_mdss_dptx0_pixel0_clk>;
+                         <&disp_cc_mdss_dptx0_pixel0_clk>,
+                         <&disp_cc_mdss_dptx0_pixel1_clk>;
                 clock-names = "core_iface",
                               "core_aux",
                               "ctrl_link",
                               "ctrl_link_iface",
-                              "stream_pixel";
+                              "stream_pixel",
+                              "stream_1_pixel";
 
                 operating-points-v2 = <&dp_opp_table>;
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 0e699de684c8..ceb3a0b70799 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -183,11 +183,13 @@ examples:
                <&dispcc_dptx0_aux_clk>,
                <&dispcc_dptx0_link_clk>,
                <&dispcc_dptx0_link_intf_clk>,
-               <&dispcc_dptx0_pixel0_clk>;
+               <&dispcc_dptx0_pixel0_clk>,
+               <&dispcc_dptx0_pixel1_clk>;
             clock-names = "core_iface", "core_aux",
                     "ctrl_link",
                     "ctrl_link_iface",
-                    "stream_pixel";
+                    "stream_pixel",
+                    "stream_1_pixel";
 
             operating-points-v2 = <&mdss_dp0_opp_table>;
 

-- 
2.50.1

