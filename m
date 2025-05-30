Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B316AC950C
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 19:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535DF10E87C;
	Fri, 30 May 2025 17:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzDz/6t6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDE910E862
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:47:51 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAx8Mw007161
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 khHTbN2zgPVwjQ4DOJcigVbiT2iFKXeeDi/XqMYdWWs=; b=hzDz/6t65S1wibMR
 djbj9dgbbbD3ZjxdBgMypqOaYGObl6HkClu5ZvO9VkSntlVw8oXE8O9Y/V1enYAw
 Dv+60D1oWJtug7qWC4HZ8laqvoIZmeZXWR423QkAwSBSe3ZDGCLY84Xg6mr+SPFm
 ILmB7SThHfPsAD9mJKd+Rk/eTggp5tzLZPYLbZJuy/UwhOcPZ4Aoo2ONRADzycEz
 KMYYEX+dqK/NP1lej4oUTyWE+p3IyN5GIf1MSWT6tAMjGHG5+0Pt2CMsCFKrSdQ5
 MA/Q64HzgTwR5asc1OMLdP5ekoVULG50I8HjMM2PzdkhIwFD0NDZPv0sa1DywBCq
 ctke5w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqj5fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 17:47:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-31220ecc586so1841296a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 10:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748627269; x=1749232069;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=khHTbN2zgPVwjQ4DOJcigVbiT2iFKXeeDi/XqMYdWWs=;
 b=JJ4YOpMH/DftmaX/q8NM84vZia2Z2Jw/+438ZhRrAj2LYaoUVbfIuwjehfPB9gV/tq
 g7pZscfIyw1A5uMab3a5690Utac3Ye4QWQ2lkIv6gYKStTRajoPgq3mwzsINnQIiabfu
 +stiRMTpZl5AtNLkq7R8yMtXiiaIKNV8iRYny94Kpxgy6h2bRPsqKb7LbMbliGvNmkLc
 WdhUxrW4sVGv3jjsfQqnYWGHIXil15RNzKMvpF6rzoUx1g3HxuT0pte4Vqvhg1GVz1gN
 rnO4zrDllo0TOifNzn7ebEBIVFTvox+l5wD7ouWQi8WpWnDrdwfX8IzLxyTsSpHiQXfJ
 Rdsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlwr/TpfcNGO0bMsAoEOA7Bfi4YNxExjCMEOr3jibSgHLimpcYQWAZ/klpAiRvykjSVDVZKxb3w/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvFtzE6sCUItE+IMa9tSuHhDK2MdNp1v4FxGsUJUQ0K1E9jxpb
 29uigHtzDKWh1VkUWNZLYizXUVfOsrCcpEdI7mgvHxrBpJzCfaUGZPwQhftAnPNhl5chub5Td+l
 A3LMh1ddPDcGysW/PKVLr4WY1XxP1DXXbeh01ZMO8RVYSufq+WA+0ckDDS1j6LgHyE40Gtog=
X-Gm-Gg: ASbGncsuimAo8bhX2PzhZp8RBG2RjZsDp0drICXw8N+x58sZmikX1sSe2UBZ11TsmmA
 5BPuAoZGvwFn9SLrmw0OSrrBb/KiuGxt/WrBVLN7kOKXqHai+sXkDJv0UEjFu8Bnd3TeyFHBs8u
 CNOjkZcmnTd1x8yRdi+fAxYkjztCuOhl8+wwQNrh1W1H2EJz2DzS+6yMHltWjhjf6eeIOCqiIym
 Mzi8xJJ3Y9zZuPf8ncStnMEwmBqSAeTrhaVYK2W+apDCe1JkSE5Yrc1oF7Gv27hWhbssHhpeILQ
 0mnuNZn+YnrG9x73qaRi6aXKBoWlzyF10y1vnOx6JjIQ6ciC6SocUT+KQDJg5FrdZaM54l/ldm8
 wQf+KxPI=
X-Received: by 2002:a17:90b:2dcb:b0:311:e8cc:425d with SMTP id
 98e67ed59e1d1-31241506d31mr6547628a91.10.1748627269549; 
 Fri, 30 May 2025 10:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY5fQBi0vRSOCOnkgAQMMl8AKALo14A/FlLGJ+QUT9fRJlX8VlW7k9UeRk1c/HvjXaY7qvJw==
X-Received: by 2002:a17:90b:2dcb:b0:311:e8cc:425d with SMTP id
 98e67ed59e1d1-31241506d31mr6547594a91.10.1748627269051; 
 Fri, 30 May 2025 10:47:49 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 10:47:48 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:47:27 -0700
Subject: [PATCH v2 4/5] dt-bindings: display/msm: add stream 1 pixel clock
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-dp_mst_bindings-v2-4-f925464d32a8@oss.qualcomm.com>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
In-Reply-To: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
 Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=8267;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=0r4My2lGG9ZWJ8k5yIrGP9vVqFB3vvLAR7AQaS0zYTQ=;
 b=pYDNza39ArfR3qQdonv9bRlqyRO8iYWgmyj2Z10EBP0qNfeAuA5obi82X86i+9DsAwAgUBcz5
 AIhRkK5NVNYDW1x9evvVyi1y7+F7vrz1j3PdEHmKtkDlpbrfc4XBf6W
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: vYjjimmeBdbwJoB6R2EvZO5IZjHAzpbY
X-Proofpoint-ORIG-GUID: vYjjimmeBdbwJoB6R2EvZO5IZjHAzpbY
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6839ef46 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iZctjB8Tiv542dVYzCoA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfX3EFTqVuKqPOw
 lcFi8zXsBn9xi780kLXQzXxpZQuoGUxdqog1NG4DsIsMFGNjSLz6AF2fbVMZ52eQRa8dHljcyxB
 Gt8dfacBNMMyotqf746b6GEomBEJSSDcnIgVpJK+2Jqyg3NJpzzdwoxOWHzJEDuKviDlsaeFYfK
 3on3IRi+A0pu9DRfO5+WMyK6ZpFYJAfLcBmU1i+Wvbn86GPpTRiXpQ3u55jdF/bnSj1Galyjz2S
 HPPU2EomaeMg9176cyIcSVprJq3t3EsCgO8w+AoAo+yIkGb5iXGuNblX/H+nR2lT3mvm4SXTOHV
 zo9XdPp0Z51J8HZ79hXV4Rq0rNNjPlYA1hIT/ywOsKHwiLJquifsTM7EXQGmyFJwjGyRE823dow
 G4+s0sogfkbYIHHQZG16mQth/OeKJjSoI1bXHmuw9WRzmFyRya8fGvS/YrCed0kNHqO3+j6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300156
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

To support MST on such chipsets, add the binding for stream 1 pixel
clock for display port controller.

Since this mode is not supported on all chipsets, add exception
rules and min/max items to clearly mark which chipsets support
only SST mode (single stream) and which ones support MST.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 36 ++++++++++++++++++++--
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  9 ++++--
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  9 ++++--
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
 5 files changed, 56 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index a63efd8de42c..81ffc141e00d 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -54,25 +54,31 @@ properties:
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
 
   clock-names:
+    minItems: 5
     items:
       - const: core_iface
       - const: core_aux
       - const: ctrl_link
       - const: ctrl_link_iface
       - const: stream_pixel
+      - const: stream_1_pixel
 
   assigned-clocks:
+    minItems: 2
     items:
       - description: link clock source
-      - description: pixel clock source
+      - description: stream 0 pixel clock source
+      - description: stream 1 pixel clock source
 
   phys:
     maxItems: 1
@@ -174,6 +180,32 @@ allOf:
       required:
         - "#sound-dai-cells"
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7280-dp
+              - qcom,sm8150-dp
+              - qcom,sc8180x-dp
+              - qcom,sc8280xp-dp
+              - qcom,sm8350-dp
+              - qcom,sm8450-dp
+              - qcom,sm8650-dp
+              - qcom,sa8775p-dp
+              - qcom,x1e80100-dp
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
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
index 951e446dc828..4fdb78a400c4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -384,15 +384,18 @@ examples:
                      <&dispcc_dptx0_aux_clk>,
                      <&dispcc_dptx0_link_clk>,
                      <&dispcc_dptx0_link_intf_clk>,
-                     <&dispcc_dptx0_pixel0_clk>;
+                     <&dispcc_dptx0_pixel0_clk>,
+                     <&dispcc_dptx0_pixel1_clk>;
             clock-names = "core_iface",
                           "core_aux",
                           "ctrl_link",
                           "ctrl_link_iface",
-                          "stream_pixel";
+                          "stream_pixel",
+                          "stream_1_pixel";
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_mdss_dptx0_pixel0_clk_src>;
+                              <&dispcc_mdss_dptx0_pixel0_clk_src>,
+                              <&dispcc_mdss_dptx0_pixel1_clk_src>;
 
             phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index a1f5a6bd328e..e1b2788e2710 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -207,15 +207,18 @@ examples:
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
 
             assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
+                              <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>,
+                              <&dispcc_disp_cc_mdss_dptx0_pixel1_clk_src>;
 
             phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 7842ef274258..445224758d34 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -380,14 +380,17 @@ examples:
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
             assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-                              <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+                              <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 791de8a277cb..1ade6aed2e20 100644
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
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
                   <&dispcc_mdss_dptx0_pixel0_clk_src>;

-- 
2.49.0

