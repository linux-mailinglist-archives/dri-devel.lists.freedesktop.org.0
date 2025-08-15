Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C251FB281C8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 16:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278A710E96D;
	Fri, 15 Aug 2025 14:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KzNde1O3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D0210E970
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:31:04 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJBUi021142
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KfETh4K6qmPtdLNq94Y6NZniMPTMfQAXconEqvFvvoM=; b=KzNde1O3uIZw4ATs
 qirL5b0D40f+WaIJ0fHVvGgnadsE64ZpUP9W2pkguxbr0e8dwovLQ9fQYIi8HDQg
 ALIidIuS7pdyLajlf+Hd0HEP/7iLNvjTaw3QKrBTpEhcxyUvxCXaLEoXuRekO0zk
 roa7Ecghy7DJC6mCHiFly9NikG+yjitBY+o9n13ZRDRZ1l6E2a3AtKV3Swy9keKr
 CBPelQ7ejCeGvoZw7hqXKsG7pkQGOqn3N/d3FfB1ot+NnY7lOCxZFKwIOTOppaem
 SpzDX4sBpYCz9GxhLTNfCCqooOMlXW1GsG2BcBGk7NK3GpW9iP8dZMQ9FwUum2J5
 HZXnWg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gk661-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:31:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109bccebaso50279301cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 07:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755268263; x=1755873063;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfETh4K6qmPtdLNq94Y6NZniMPTMfQAXconEqvFvvoM=;
 b=HJwE2PADy6QdOv5OELg8xP2bs0D8IN0VjZ6wOzZzLt9UKvLzhbopmhPVFhvoX793EN
 kx+5wlSYUkKXo6f9lDvS733qIU0HFBE6fnwyTzGfHQ7Lr1axFVYhoc7IIINkDL1uTYQP
 ILHpuUieBZWKMSx6+SdISafZrQKLjariH7hFZcStCxwp3OS2DXTyU/wOkL8/kBi9qUBn
 0OInE/PtwyBwOx9iZpTez55k9sFZvLszY1hLkP3TozM0jcJxkHRPFUvAbyIl+y35OdsX
 +z4xk9ullkedhAQAYHGyajnPDJRkvnXHM9jNNj3LGEoCIpUK1b+YdSFpz2VRclPpXsrR
 zWMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN9c9k80gkYVKVXVHS4rojiwUXPQe4e55J0NingmAOqRgMljZmYwxYuPoRmCnloa1vf5l/WkkdkHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwocZnu0kesR2q+qCvCUTmBC4bum1x4jcd7t1lbeY5zekSJZAkF
 UYq8iHdjUskD51iMbppipv9hIoMPxpRKlDOr6flQdT4UrU+SRMP+g+/HKwchB7KfL33f/m3Zn+n
 N5IHzcABD6mrvdAaihkkPvihagS0xVE+JludoHdj3bipZo1EerylMw4kF4/wMPULpF6+4B8w=
X-Gm-Gg: ASbGncupbaNmSQyBCZwCDRFx2ETTIPPDezBTQCnoS78biGTV8fqCrNh/DDCSJeBTGRo
 E41s58BhWDvFnQxBj+1wjFD1gJ30H7Hene6h/rK7uyOEffUpU2o90u4Nef2JMf4y7U7IV/XfxKr
 CjGkXaZ28la6tiVHNdeBorW91JLiQVBLTXkblZQl0UBZMKiQS3fFj/T/puwpblAGHsGZPD1fRd1
 +1mPxxDZPS977elfky0rMxhAr7zKxBwu48Yucxbp1DZfh9+z2TZ33ImP7S/4e2yRAtO+vRk+a3U
 qNL0hfvj3lgTAJUQo/RFvlBCaZVFm+stu68H7z7Rs6ynz2WkTdeJlWCSAUpvb7yx4W6SylljhMI
 X561PZxA7E22tg0hUulAw3/xrOXMr+FZf4AHj2l9otp0UESCxdzr8
X-Received: by 2002:ad4:4ee9:0:b0:709:e3ae:d598 with SMTP id
 6a1803df08f44-70ba7aa107emr27452546d6.14.1755268254913; 
 Fri, 15 Aug 2025 07:30:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHzkjcE9QFH6C8GsOWf+bI1nL79t0RvOx0lFYbJwPrQK6r9e1mxmNnzdlb57E+T2XKZxqPdg==
X-Received: by 2002:ad4:4ee9:0:b0:709:e3ae:d598 with SMTP id
 6a1803df08f44-70ba7aa107emr27445506d6.14.1755268247803; 
 Fri, 15 Aug 2025 07:30:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f358bsm305661e87.110.2025.08.15.07.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 07:30:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 17:30:32 +0300
Subject: [PATCH v6 5/6] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-dp_mst_bindings-v6-5-e715bbbb5386@oss.qualcomm.com>
References: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
In-Reply-To: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10942;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z3VVC8Wx5ERE2Hqi3FjjhGex4zlnXnJDVqE+z1ExRBc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon0SIMZTmLZTEHVWVeBk+/alIGiBN7QFfaqY9V
 cxeH4Y/JE2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9EiAAKCRCLPIo+Aiko
 1RAIB/4qSO1YgQgCJ96CbguS2UgzQmu6bHYCo4+g5Jg7DZKyuopvaeN0nCE0DQXGR5CM2oV0E5Y
 30EIKpDzSE9BxtbAGOF51gwlmUA6ciQ/gf4baKIfoYfH58byPp4r73N05hTcSh6arPaiiXWaqcr
 O7XEaey0SptyokoDE7wh4WlYlr8LqiIY1TQMKlu+Ir+fN5vBzTYJ0BG6R+cik5+VWITdzmQ9733
 tge3JUxhrRUMPCoQfK6a0YpX/oZ2o2vOmzjEMkkKhbN4l6tJhQ4whw8hgMQP3cfPWTfpuk+7lV/
 7+Ei+Vuh+uTdtMdf3THIMdoSuGAWMivIFelru3/Bf2qbUH3U
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689f44a8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qc1Uspymv7P7Zclm908A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX6jdIn9uggBnC
 cihKCKkLWfyHo9q6vNvY8obEXJsTftszb2CrZPUH+wKBV1Zdv8jB1bJwk27saxf+AzHsSoU7ZOR
 b0Y92yIjEKWwxaeOUjX5uneFdvRq4T0A5FRSpwHt2s6lAA3BdPgisWfSPsy4zHVVg7nlB4szhZ9
 akzxQ2m5q0pa9ZSajKzeeqw9RVN/ev7IsryWs5vFQZSMZXoWaixRM+pM8PiyieFVdsEW+E1ehe5
 qNqUaBI486TLjFsM9HFQ8fzWX+l/q+SLS6yAykOZio8qpOyPZ9BfcvCJkYxIGHsXo/Ntsd4keDe
 Oz3eygr9O0gSVdzBj49emSYhtaGGvZiloN9w3D0S/ev6SdRQb+p9ZBZd5H0Js4DlkoeWuOoIsmE
 nMZBCV8J
X-Proofpoint-GUID: 9k_Bai5Q5SEZE4KR3UTK7U5Jql5No1uy
X-Proofpoint-ORIG-GUID: 9k_Bai5Q5SEZE4KR3UTK7U5Jql5No1uy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
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
use up to 4 stream pixel clocks for the DisplayPort controller. Expand
corresponding clock bindings for these platforms and fix example
schema files to follow updated bindings.

Note: On chipsets that do support MST, the number of streams supported
can vary between controllers. For example, SA8775P supports 4 MST
streams on mdss_dp0 but only 2 streams on mdss_dp1.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 63 +++++++++++++++++++++-
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 20 +++++--
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 10 ++--
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 10 ++--
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 10 ++--
 5 files changed, 99 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 352824c245224d7b5e096770684795625fc9f146..68a6fd27506fda004e53174db5bcc88a29e8d2a6 100644
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
@@ -187,6 +195,59 @@ allOf:
         required:
           - "#sound-dai-cells"
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7180-dp
+              - qcom,sc7280-dp
+              - qcom,sc7280-edp
+              - qcom,sc8180x-edp
+              - qcom,sc8280xp-edp
+              - qcom,sm6350-dp
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+    else:
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                # some of SA8775P DP controllers support 4 streams MST,
+                # others just 2 streams MST
+                - qcom,sa8775p-dp
+      then:
+        properties:
+          clocks:
+            minItems: 6
+            maxItems: 8
+      else:
+        if:
+          properties:
+            compatible:
+              contains:
+                enum:
+                  # on these platforms some DP controllers support 2 streams
+                  # MST, others are SST only
+                  - qcom,sc8280xp-dp
+                  - qcom,x1e80100-dp
+        then:
+          properties:
+            clocks:
+              minItems: 5
+              maxItems: 6
+        else:
+          # Default to 2 streams MST
+          properties:
+            clocks:
+              minItems: 6
+              maxItems: 6
+
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 1053b3bc49086185d17c7c18d56fb4caf98c2eda..2ca7a12bb4bcb4316107c5f5dfc69b0f9959c3a0 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -384,16 +384,28 @@ examples:
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

