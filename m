Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C546B3ADC3
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 00:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F7510EAF4;
	Thu, 28 Aug 2025 22:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ibNKvDax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B90A10EAFF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:36 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWbkn013474
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qOieTx33OYOAntck1pu6Ux3Fbf2SwcnRNN/9vHg8FaY=; b=ibNKvDaxNya5Qw3k
 HJivG8SC466TDvAr0uW0N3WHRG98/trU+OCA0F7l4GnobpgvAf9k/s8YtsCR9eSs
 gdexfLJtpeKMMkxNQR2kz4nXcix0vwSSNqRWraRwtWs/4Ool2Lj8DabWf5rqhnwi
 1Cppzx/cEVb89x82LuwxwvJaA2PngdhXqtVIOi7JEc7YBXSxB4I6PcyOMtHdCSBp
 oqCraLSy6EaU3Q4auoPGwxzvz0v2uOxbqyVLST4n/AiiyvfPZVsDNasfOiCJXZeb
 BB2PCKfXw7VAqKyeMgGjWnqYO4yRPY5dva9QZAklIe9v2eFnTkqo/OmRaz2+p81P
 K+EWRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5ssrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b2a1344b36so28299271cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421314; x=1757026114;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qOieTx33OYOAntck1pu6Ux3Fbf2SwcnRNN/9vHg8FaY=;
 b=o+0nTulICgTaI7rDMhEWtwMz9nl/SkNvU4wBF6fxFMuf4ZQTv/mcH/lS4kkbBcs1bb
 ggFs7LNTSZvtjiupqKq8X7rkkZBrLm43hPbsv2GxLA4qLt7nmoukkD/ioxdLNEwpNMdM
 +0mZu67TuuNfZuzA110vrsDLfgdir8AFQlmrNCbJGQVE7I9NOBLo3xcypGa36PefesTi
 riY/k2j/qXpOGuw58nFLoiuHHOKl+Gj41NNJfRht04kBYMFBuFzHcjDGZcffgTB0OrUS
 CrtwZ0DiPLeJACERfABQZP/nF944AZ773fWfEnpf1+frk3XNwKi15Uiad1K+8+/gfW9o
 vrGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGM7s3TX6JKHg0UBfOP5/CZ2a1QbobBUxSLmrLGHhjbfbO0XqqoW6UER5zGoKMIhNt2DL6CraZKdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBykLwIHMJryk78cqzdbebs9uq0BtT4LlTrAs+Kxt0avcbvAtx
 BO05rnLoq/mThn0S9IS4Xv6YSoOrnQqed/qFsTxvK8lqYTYc0KiqeRFj+v87Hwi1tpu7cXb85vb
 58X1ratorDWZ0wd8L9GVdndin4emU53DWOM1CwVa3/taMHMOd8VlNoPHRvYXohauCvcdgjOc=
X-Gm-Gg: ASbGncuteM0gFeWKLw/G9MDXFFUj9C0lHZCg1r/atzQIQnU+3y/YQRJ165sa7OSsIhM
 ghsAmBm0aZby+x2MJJVFbkpy9HYeRyW03MygHfw/p/fyhHuX2enHLYCfFpdDo4G/kKL2LcbOHSg
 cZ7ug7Ojg5jMSQ85IpIXHKbVQNTI0LvA1PHOu+ilbtMh7gUj9EkFD4INa19jY23w1JPfXBnMN8A
 CpW/ZSG92z2XMDRuEAP7Zduk3KF9U7jHPEgdIyTE4nXHW0ApoNfAsrSUiKajrTWK7LgvHBpanoa
 CneJB904lMA1RZ6GPT1lFM0nzLIXBq/6IDJu9U1gEwxxYa0G/2zDAp/EJ2PBthLzkr4A+9kHrnA
 QYEAlEBMNYlYN3E+PsvYyYZaqRh1ZKBBXZud/GggKKdLupoJDYTyi
X-Received: by 2002:a05:622a:1a0f:b0:4b2:987d:3992 with SMTP id
 d75a77b69052e-4b2aaa27e0fmr265756901cf.14.1756421314192; 
 Thu, 28 Aug 2025 15:48:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfyvHqUxvJLfJeMWH5JgSwxE/VCHcSLym5cm/Ee7aWYkPEXlZsbqvRqR+C+qyKVz+azHQCjQ==
X-Received: by 2002:a05:622a:1a0f:b0:4b2:987d:3992 with SMTP id
 d75a77b69052e-4b2aaa27e0fmr265756491cf.14.1756421313597; 
 Thu, 28 Aug 2025 15:48:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:20 +0300
Subject: [PATCH v7 7/9] dt-bindings: display/msm: expand to support MST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-7-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14870;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=C2VsL6/7386lEMyPGm3O80Fg6Ts6b/RJXYqdb7O+DBw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNyxInvewydByX657ZIdq5YnisT50x/iMvVoR
 6vtA+85z4mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsQAKCRCLPIo+Aiko
 1el3B/4+gw71d+6H6vzQlsJHjRbJ6xmik/0xR5d9Bj9fWRC7xbHwKuxz/fiP1iceYFVjj+g4qUH
 8z4fnn7gaWzTp42H+kSB7xqcuHEVmUXUhtnLKiCOsyoi3E7Gm2eyMWoxLcSj7AffVEvHBPdVKQM
 HmgD9kv8zH/Gtbs6errqaCRlEeNHWu349dOiNdM9b8iDpuRh+Pb8mrQ6KHcMd5E0ohhrlQSSdeN
 AZ3Y+ddwE65V+RtIGjLQGiEncfeNUUDl2TX7yX9gX2llZS4juWXe0XbOvaITGXdUYt5Dg/m8FDb
 48LXjUC1LjEoldlYPbbgxmmOdnjdnDLRO7FsIMhTUh7jFSks
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXx3aPgce0QcIf
 dBFfTnLm/JekaYLtEUjb8fR68zUz4I3hOVU5SX89Nm99ZWq+M+xwI1hEtUC601De3tZ9N7fZfd7
 l8Cg0Fs9VHconG7ulWull/b53x9f0D4csxB1PUYBUb43UEAlgS2ZNcvEV49Bjq1FLpdhnZgPmjx
 4trLsi68o+ztdGbKfNXbd6KYl55t0jyQA0XvvHFMpITZI5yByHbOvupQcd3CEJ+Skw+XCWFlfHj
 Ih5cVumjNrc2IjQEbNt7UUby81cGKHr4mlftpPbwfcfz43OoqS/wipXperIWsJ9lbfPZYMrODjo
 qvEW8wgbOj7m/F2ld17lit6MxAvtg0Do0JeEdBH/eP86jrXlxNQgeDXkl8mvyvH4upD7pB7efVf
 NdfiA9nV
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68b0dcc3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uRafYTt1GBQvBzODlV0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Bux0xjTVuI1ALWpGnz6KcknMpCk_Rs2Y
X-Proofpoint-ORIG-GUID: Bux0xjTVuI1ALWpGnz6KcknMpCk_Rs2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On a vast majority of Qualcomm chipsets DisplayPort controller can
support several MST streams (up to 4x). To support MST these chipsets
use up to 4 stream pixel clocks for the DisplayPort controller and
several extra register regions. Expand corresponding region and clock
bindings for these platforms and fix example schema files to follow
updated bindings.

Note: On chipsets that support MST, the number of streams supported
can vary between controllers. For example, SA8775P supports 4 MST
streams on mdss_dp0 but only 2 streams on mdss_dp1.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 91 +++++++++++++++++++++-
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 26 +++++--
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 10 ++-
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  3 +-
 .../bindings/display/msm/qcom,sm7150-mdss.yaml     | 10 ++-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 10 ++-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 10 ++-
 7 files changed, 138 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index afe01332d66c3c2e6e5848ce3d864079ce71f3cd..8282f3ca45c8b18f159670a7d8c4d9515cdb62ca 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -66,25 +66,37 @@ properties:
       - description: link register block
       - description: p0 register block
       - description: p1 register block
+      - description: p2 register block
+      - description: p3 register block
+      - description: mst2link register block
+      - description: mst3link register block
 
   interrupts:
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
@@ -166,7 +178,6 @@ required:
 allOf:
   # AUX BUS does not exist on DP controllers
   # Audio output also is present only on DP output
-  # p1 regions is present on DP, but not on eDP
   - if:
       properties:
         compatible:
@@ -195,11 +206,83 @@ allOf:
       else:
         properties:
           aux-bus: false
-          reg:
-            minItems: 5
         required:
           - "#sound-dai-cells"
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support SST only
+              - qcom,sc7180-dp
+              - qcom,sc7280-dp
+              - qcom,sc7280-edp
+              - qcom,sc8180x-edp
+              - qcom,sc8280xp-edp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        clocks:
+          minItems: 5
+          maxItems: 5
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support 2 streams MST on some interfaces,
+              # others are SST only
+              - qcom,sc8280xp-dp
+              - qcom,x1e80100-dp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        clocks:
+          minItems: 5
+          maxItems: 6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            # 2 streams MST
+            enum:
+              - qcom,sc8180x-dp
+              - qcom,sdm845-dp
+              - qcom,sm8350-dp
+              - qcom,sm8650-dp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 5
+        clocks:
+          minItems: 6
+          maxItems: 6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support 4 stream MST on first DP,
+              # 2 streams MST on the second one.
+              - qcom,sa8775p-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 6
+          maxItems: 8
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 1053b3bc49086185d17c7c18d56fb4caf98c2eda..e2730a2f25cfb0496f47ad9f3f9cbf69b1d4649f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -375,7 +375,11 @@ examples:
                   <0xaf54200 0x0c0>,
                   <0xaf55000 0x770>,
                   <0xaf56000 0x09c>,
-                  <0xaf57000 0x09c>;
+                  <0xaf57000 0x09c>,
+                  <0xaf58000 0x09c>,
+                  <0xaf59000 0x09c>,
+                  <0xaf5a000 0x23c>,
+                  <0xaf5b000 0x23c>;
 
             interrupt-parent = <&mdss0>;
             interrupts = <12>;
@@ -384,16 +388,28 @@ examples:
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
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
+                              <&dispcc_mdss_dptx0_pixel0_clk_src>,
+                              <&dispcc_mdss_dptx0_pixel1_clk_src>,
+                              <&dispcc_mdss_dptx0_pixel2_clk_src>,
+                              <&dispcc_mdss_dptx0_pixel3_clk_src>;
+            assigned-clock-parents = <&mdss0_dp0_phy 0>,
+                                     <&mdss0_dp0_phy 1>,
+                                     <&mdss0_dp0_phy 1>,
+                                     <&mdss0_dp0_phy 1>;
 
             phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index 870144b53cec9d3e0892276e14b49b745d021879..44c1bb9e41094197b2a6855c0d992fda8c1240a4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -207,16 +207,20 @@ examples:
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
             assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
+                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>,
                                      <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
 
             phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 2947f27e0585216ca0e1eab6a79afcb21323b201..b643d3adf66947095490b51625a03635c64c37c2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -281,7 +281,8 @@ examples:
             reg = <0xaea0000 0x200>,
                   <0xaea0200 0x200>,
                   <0xaea0400 0xc00>,
-                  <0xaea1000 0x400>;
+                  <0xaea1000 0x400>,
+                  <0xaea1400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <14>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index c5d209019124da3127285f61bf5a27d346a3d8a1..9b0621d88d508fb441f004261c42c2473bea2bcb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -394,16 +394,20 @@ examples:
                      <&dispcc_mdss_dp_aux_clk>,
                      <&dispcc_mdss_dp_link_clk>,
                      <&dispcc_mdss_dp_link_intf_clk>,
-                     <&dispcc_mdss_dp_pixel_clk>;
+                     <&dispcc_mdss_dp_pixel_clk>,
+                     <&dispcc_mdss_dp_pixel1_clk>;
             clock-names = "core_iface",
                           "core_aux",
                           "ctrl_link",
                           "ctrl_link_iface",
-                          "stream_pixel";
+                          "stream_pixel",
+                          "stream_1_pixel";
 
             assigned-clocks = <&dispcc_mdss_dp_link_clk_src>,
-                              <&dispcc_mdss_dp_pixel_clk_src>;
+                              <&dispcc_mdss_dp_pixel_clk_src>,
+                              <&dispcc_mdss_dp_pixel1_clk_src>;
             assigned-clock-parents = <&dp_phy 0>,
+                                     <&dp_phy 1>,
                                      <&dp_phy 1>;
 
             operating-points-v2 = <&dp_opp_table>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index 72c70edc1fb01c61f8aad24fdb58bfb4f62a6e34..4151f475f3bc36a584493722db207a3dd5f96eed 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -401,16 +401,20 @@ examples:
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
 
                 assigned-clocks = <&disp_cc_mdss_dptx0_link_clk_src>,
-                                  <&disp_cc_mdss_dptx0_pixel0_clk_src>;
+                                  <&disp_cc_mdss_dptx0_pixel0_clk_src>,
+                                  <&disp_cc_mdss_dptx0_pixel1_clk_src>;
                 assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                                         <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
                                          <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
                 operating-points-v2 = <&dp_opp_table>;
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index e35230a864379c195600ff67820d6a39b6f73ef4..8d698a2e055a88b6485606d9708e488e6bc82341 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -183,15 +183,19 @@ examples:
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
-                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
+                  <&dispcc_mdss_dptx0_pixel0_clk_src>,
+                  <&dispcc_mdss_dptx0_pixel1_clk_src>;
             assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
                   <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
             operating-points-v2 = <&mdss_dp0_opp_table>;

-- 
2.47.2

