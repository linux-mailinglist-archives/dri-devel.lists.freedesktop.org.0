Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A961B097C6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 01:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADFA10E8C8;
	Thu, 17 Jul 2025 23:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQXeMR7S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A5510E8C8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HNEsDf000543
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lWApfG2mxCWAzM0ioYEsIC8m21xEZWVI0AmdT2yj6sc=; b=PQXeMR7Sl/LioOF0
 mA9oHRpo5WOdK91NCBmGERegP/Nvo4E8toy5yu1edWoEZmFvl7JWDOy+ymiQlPgO
 M0b6WiMYCKJlVrcaNeG6IdXl8E2cVIwguzWl2IEobm0n9eaeIqrO+nGok44l6lg+
 rF4thoNvKdnAgN3VcqLnBRfuufzqe4Y6/iBWbtRvBOinoF4kfPJrvNH8dX/ThAWr
 PsBYc6I3NsdzBtvNn8EEYxGPamFoiEt5ypcQxnAJaDKcHaoICsZ1kgbI/EYKpnb2
 u3MGrlYUhkUSGuzuLviGvRgZSLZkINZpEWvM6MrE+R28odo6/HH5UZQa5Zad46hH
 7UE7rg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drvhjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 23:28:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-235e7550f7bso14077935ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752794937; x=1753399737;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lWApfG2mxCWAzM0ioYEsIC8m21xEZWVI0AmdT2yj6sc=;
 b=Ty2y835eV3Ytn2aa+APVREHMeSkIeAWDJPrEGZR4kRjVdzqPdZbpmFrsMm0hL7mHED
 XLFKlZy0XbLCv18WvuEh7M7jIUuv8cNhK0Fs5PAazwJSwi3DiH6nTaoOysGz0P5Zi7b5
 PiOq7duA/qqNXjcHC4fJokNq1WJSzzIsQShnF5L7/mpw/lofCaA4Eb4RSVVwVvX75XZ8
 WeTQNeBJFiGR4DU8GEieQMFlp2EoLkD6rgIqrJbEzBCzbdC6xnuPdxxRzvWO0dGWCuR7
 QYGCZp4yhDHD4cQj9qnE7yYBz2rUtH844QhDksRaBz4MfJOOjQN8+zaDt0jDH+A/yH+X
 IuLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRZZuTCVEbbJJLawcMl2hOR0FK+Kk3fDpTwQetvrs6Dg11VZn54hpxk5dCgzvkqYcK+Gx9Hcaq0zE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEv91+1Vv6VFg4PJMhUUaRYJZA8+iHSFu1EEott4ZXkM55rZO9
 n/8u9slddoeCwNZBmKX9uxH2YgG+I2GOj35fsr0KpR39RfuaoSofFjh3t47tp3lFBuh5qn8RV9M
 GJqJmtD1+Aiqhltv+hyioq5cSXV2kuv9OcCwZaidY5b6rryu3YPl1larE59nc9ln+Xx+FSZY=
X-Gm-Gg: ASbGncsr23Cg3LqPc24YPPpdilHTSo9zq/WZgYc/nOWlHVIoPELmu5OGOPeyxE40S6A
 LWbMRE1X0umS3wb0NuHoBgoK5vIQuDb4KJXKxH53A4BiismWA4ANKWci1i9KVElmiPWhzV/Gcf+
 2f54yFKX8/8Wgi6iiiiYaougrELa/j+PVrFwEGduDjIV4ScfdpMbW1WBC3sF5ljLv5MCI1j5UUP
 10dvEVPOXQ/YRHv/cFaY80UfUJWiCgsz8Q/u5RKx+y4ak6xw4ZykUh8pINjqoCmd4/71Mr/y3P6
 IP6ZXgZHYsQwALUgxpNx+3lt0Qq+S+sEHsWmTWuinkl1u8M9H+CME+Zi0NBDPP6Bepenf78X1VJ
 3S3YDAj1QiifiUjFS0v1hnLh+
X-Received: by 2002:a17:902:e5cf:b0:235:225d:3087 with SMTP id
 d9443c01a7336-23e3b80c9femr8053155ad.30.1752794937021; 
 Thu, 17 Jul 2025 16:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhH6tJEH4IvPWPkNyHBRb0ZJ9qv+LFEoEsSd2RwQQYetT44kKI8ABmB5MC5Z+R+lVggcU3ZA==
X-Received: by 2002:a17:902:e5cf:b0:235:225d:3087 with SMTP id
 d9443c01a7336-23e3b80c9femr8052875ad.30.1752794936504; 
 Thu, 17 Jul 2025 16:28:56 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e3cb7sm2002195ad.17.2025.07.17.16.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 16:28:56 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:28:45 -0700
Subject: [PATCH v3 3/5] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-dp_mst_bindings-v3-3-72ce08285703@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752794927; l=7576;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=Z7Q5MhFNW++3sg2l+MY10L8IMh9EAArq7s0Yr3E5sqQ=;
 b=bXvkMgRG/fOCiubHjM5Jn0LKe5/Q9lqISkXucJ1CRsxFEN778kZWlM3xXVklsfaaCbVIwiSFB
 ycoZ/YlAjoBCOiAORpn6mMaJdtIv28Sf0ik3WqYNt6hPeRhc20TpUZb
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: iZR0ttuQ8cD3_8J_QXOHRW-lqYJAYeyf
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6879873a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=y-iibUknMj623qMt5boA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iZR0ttuQ8cD3_8J_QXOHRW-lqYJAYeyf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDIwNiBTYWx0ZWRfX+7vIUPjiYe9s
 IULqzKUmsYMNIYH/dvPrs7gJS2G/RSWP/Btg3AnuXt5DML65AZAfzX86CBv5LXmtgU9LC1KkLwP
 l+61fcTJe61r8wQ51mlGyIYCyiBsB+nLAFPAvOWW1n2ukApeyUxkAfSJhiuvRb9a/4AjbmnPSHt
 0phTcbU1dBtouQfXuTZyCSiwDjg8IgQ+pRaRY/L24plTqdOyuH8Fvy5ma4c7rtFxmH300YlbLF8
 /vkuVCe5iYuSP3IMhbc8DpanPoYv39Sd/ZxflRGxlNNwYgKaxYCRoXXFbO1denxSvoN2mUtYKXh
 7uFf8FE3PplI01h9ft1Dv62X632+w4o37QtCq1sloynfBj46LJoPUpbgE4k5rnygfveGlxXaaUL
 zsAz1/a3KkaOBrpZMLfiAAY6DYtiwngyEbWLzdLLeY4lPEa9yx8z7EjgiGCxCJqqtGyqjW5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170206
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

Current documentation of assigned-clock-parents for dp controller does not
describe its functionality correctly making it harder to extend it for
adding multiple streams.

Instead of fixing up the documentation, drop the assigned-clock-parents
and assigned-clocks along with the usages in the chipset specific MDSS
yaml files.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml    | 15 ---------------
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml           |  4 ----
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml          |  5 -----
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml |  3 ---
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml |  6 ------
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml |  5 -----
 .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml |  5 -----
 7 files changed, 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 4676aa8db2f4..d8d94f62c102 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -73,16 +73,6 @@ properties:
       - const: ctrl_link_iface
       - const: stream_pixel
 
-  assigned-clocks:
-    items:
-      - description: link clock source
-      - description: pixel clock source
-
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 
@@ -209,11 +199,6 @@ examples:
                       "ctrl_link",
                       "ctrl_link_iface", "stream_pixel";
 
-        assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-                          <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-
-        assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-
         phys = <&dp_phy>;
         phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 1053b3bc4908..2dc76a074da1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -391,10 +391,6 @@ examples:
                           "ctrl_link_iface",
                           "stream_pixel";
 
-            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
-
             phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index 870144b53cec..eef5627133db 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -214,11 +214,6 @@ examples:
                           "ctrl_link_iface",
                           "stream_pixel";
 
-            assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
-                              <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
-                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
-
             phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 7a0555b15ddf..a2b71b476357 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -267,9 +267,6 @@ examples:
                      <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
             clock-names = "core_iface", "core_aux", "ctrl_link",
                           "ctrl_link_iface", "stream_pixel";
-            assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-                              <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 2947f27e0585..9e52ac9c0eb4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -296,9 +296,6 @@ examples:
                           "ctrl_link",
                           "ctrl_link_iface",
                           "stream_pixel";
-            assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
-                              <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
 
             phys = <&mdss_edp_phy>;
             phy-names = "dp";
@@ -387,9 +384,6 @@ examples:
                           "ctrl_link",
                           "ctrl_link_iface",
                           "stream_pixel";
-            assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
-                              <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 13c5d5ffabde..eafea2fe1c95 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -399,11 +399,6 @@ examples:
                           "ctrl_link_iface",
                           "stream_pixel";
 
-            assigned-clocks = <&dispcc_mdss_dp_link_clk_src>,
-                              <&dispcc_mdss_dp_pixel_clk_src>;
-            assigned-clock-parents = <&dp_phy 0>,
-                                     <&dp_phy 1>;
-
             operating-points-v2 = <&dp_opp_table>;
             power-domains = <&rpmhpd RPMHPD_CX>;
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index 72c70edc1fb0..0858dd61fb0f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -408,11 +408,6 @@ examples:
                               "ctrl_link_iface",
                               "stream_pixel";
 
-                assigned-clocks = <&disp_cc_mdss_dptx0_link_clk_src>,
-                                  <&disp_cc_mdss_dptx0_pixel0_clk_src>;
-                assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
-                                         <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
-
                 operating-points-v2 = <&dp_opp_table>;
 
                 power-domains = <&rpmhpd RPMHPD_MMCX>;

-- 
2.50.1

