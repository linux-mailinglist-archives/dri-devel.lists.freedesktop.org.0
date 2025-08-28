Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A7B3ADB7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 00:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D2C10EAFB;
	Thu, 28 Aug 2025 22:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXaf2jas";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0857E10EAF4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWblC013485
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 atpsxElvXgCLWEtnfNMUFNLYSDL18dufzTm3oOR6c98=; b=pXaf2jaspyHIpMVn
 hprMkRQd/uIY90UJjgr9VTuftKB0btKHUysmgjAwaiq93j1kE3rbFPserZ/I9nyP
 S2XzYdTTjsXZ1r2pMYhqCXx6+vEKtYS62K+yQHT1wsjKQpPDxnS8SV0grGr50Gig
 qa8BqpVRp3+4b7w6hqVQt4w7lRnys6oVGvZnOIdE8nQzlcrfhi97RtMIZLymuaHf
 z6rv3rfPmw3lRsgxGFd1bBaTmsOHDdEO4W7fTd6e/fJQHydOfNxKvAXcJjunsxmi
 60AOOjWIgF04sqyZTogUj9KPeCUuPAvvPVBVWcC35KQv8n6FCmQmu73d0U3ppHe0
 Zb+0zQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5ssqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b2f78511e6so44809981cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421305; x=1757026105;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atpsxElvXgCLWEtnfNMUFNLYSDL18dufzTm3oOR6c98=;
 b=t7KfuM7Ha9sK1OONjtzp1zL+NnOq6B12HLZIxPukKrxSM7qm+6o38nZwCz13xlJFQL
 X82iSuAZYQ9uDXiXCvsGg9nCTt16CSXKMOr21ODo8n2qTB0DrpWjydXxXhb/HBoRFZFd
 rPuNceuTXlXIsH55AYtQPz2DpaOVPj/HT4Iiql9pMFarFJK4l9mxbuxRNZQyYPRjD7Vu
 kLUO4f02sHAAJ8K7mFYAkwmOpuCra28OV31SbJcwF1RTMzCGm7+2feg/ppXkFqmUDfO6
 hjX/4FRFjaVSbuye1kBLmzBthcGtMCtASc3fAfakfQ1PniMWqkvfHDxqMJh9RvubVrHO
 eqYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEEKKcbXHTFazIO9/pIEUdB5OYZZu4fZexkU4yNaSG1qt2NQBwA1pLZOrPBA/2rMzvIV7keP+dRHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ8H5kArjhDjOTG/8NQrFsH/hTFx2Bdfkc2QAeDB7yIZKRQwfB
 kEAbq73av0pNR03EV5k+IrVgoRnGxY7FHBGBzu8n9uvWHdgvtdEJar4IYczVBNi6gYXEhlr+gKe
 8WX63S1AiD7srOblP8Ur52GcNaj5P8QDEbkoxwuocyaa5XAh/bdbO3X0t4Mv5w1N0XV3AJWYss9
 zf4ZQ=
X-Gm-Gg: ASbGncuzpPNLQClHP5xId7k+2jm/ZkDgEcyJ6hVCPyRFvzJmHKtfiMBOdk++RURDwxE
 bXn1JHBTrJ9ihW7v+qcVMA57W11AxiLSiRf52M+alWYBvLL/ut64LAUVqxnz+vfPsNYSkrR98ZZ
 qPOaOOieBbUEgxg/aE+6CAys8SFE/A0IJuMtKORdHxeC4kJipM2Kh6pPcmTBrkRizM6indepLzi
 23h3GUMu94OiqxKaz+GgPu9YZHvoU+34MpsUZrUV2acMziVW09rZE3Y+EetfajiR3QBMBcWwjXz
 Cl2OoyPtmjM+4ZAhY85cT/qiAv32RXXeaf0n4VYrFNN1O7mcTz2yhKWRR8sSgyVEdKnJ8s8SXjF
 wtYn1Tp/fjINQhlD8H+NDQvs/J5D/GNJ1aWzEzkYlqjBbCUoNqorF
X-Received: by 2002:a05:622a:1115:b0:4b2:8ac4:f077 with SMTP id
 d75a77b69052e-4b2aab8aca4mr318534971cf.73.1756421304706; 
 Thu, 28 Aug 2025 15:48:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOaOKIaf2gQXbFaTcYE3UUBr+6LweGy7t6jUudPKOzD+KugsPTc/esP3MeyEzVnJtBeiF1jw==
X-Received: by 2002:a05:622a:1115:b0:4b2:8ac4:f077 with SMTP id
 d75a77b69052e-4b2aab8aca4mr318534781cf.73.1756421304194; 
 Thu, 28 Aug 2025 15:48:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:16 +0300
Subject: [PATCH v7 3/9] dt-bindings: display/msm: dp-controller: document
 DP on SM7150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-3-2b268a43917b@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7SN93yAhsVlIHhAjv83yfgqh9HpWqOytsXh6bquwkv4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNyweOQwCO+rx4f83aSf6TE5GnLajMRr4KfVn
 ESULxvnJhmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsAAKCRCLPIo+Aiko
 1ZIRB/0SZBALvHgk3Yngot00vR5KhYi3qn2VB8YGMhU3sZV2nNCmtZdtrchmslJIRsHamS8NXeB
 ptLOSexHR7ZBf5yE4YERhMP4347hHPbisVx29VgP+kyu3htD4qNYwSvjMGQdlUbFQL0/6wiG3pE
 OtpkGZI/eHq4V/aA49PoUNRWXb/VUwE/UkxgrmImOSl9sku5HgXGyIMhrwspV772n2hry8aKlcU
 kYpYKniZxW2YreAZMtdFX7Io/brm2aTpZgpvmCJ9+zjqO9KKJx8uFT+gRBgi4XA6QaF+35KgQG4
 Yp8231dT3UaO6dt+1/ZlTyoGML5+dXWEdnzlJPiSxbtsDnqk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX2uvwxz2iKGSp
 iFZTbAptiaBnX8dew7zFiO6qxK+wPzv7uOCXVBMBFjbpTQdwT90tjGVR+igAbksO14vCpdaU2LE
 no5d2iFa6B9V1t52SPAkGFMXWmGAWhRUG5140L7JnzRyZ4ZRU4A3WGc+OlzhwFdzKswwDovPDBB
 7JXOmiyaeEbogLKjEiqIxJC80gOFQDBu/2QBf4LQC+1++CUgy262e2UhXhD8yPIyiu+3R6Gty0m
 9eooRgQsNn43cvL/k9UBHjuTVSvl/8a+nafWyKHXQSEddAU3B+2lPXcoJzDCvxfmw0LdLyOmCCT
 0Ro3oqGw8Y1ZlbuvzkY6XuW4wNMQPCF3eZE6cew00/7f+evA+xXYOH779oT52lApKtkeJrjB6fS
 KGNwncxw
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68b0dcba cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QYKTPsKsHukT_2dPOMMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _AqDAVX2x_NmcWeJQCRH_7NLXIaJZCzP
X-Proofpoint-ORIG-GUID: _AqDAVX2x_NmcWeJQCRH_7NLXIaJZCzP
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

The qcom,sm7150-dp compatible is documented in schema. Mark DisplayPort
controller as compatible with SM8350.

Fixes: 726eded12dd7 ("dt-bindings: display/msm: Add SM7150 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0f814aa6f51406fdbdd7386027f88dfbacb24392..a18183f7ec21ac0d09fecb86e8e77e3e4fffec12 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,sar2130p-dp
+              - qcom,sm7150-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 13c5d5ffabde9b0fc5af11aad1fcee860939c66f..c5d209019124da3127285f61bf5a27d346a3d8a1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -61,7 +61,8 @@ patternProperties:
     additionalProperties: true
     properties:
       compatible:
-        const: qcom,sm7150-dp
+        contains:
+          const: qcom,sm7150-dp
 
   "^dsi@[0-9a-f]+$":
     type: object
@@ -378,7 +379,8 @@ examples:
         };
 
         displayport-controller@ae90000 {
-            compatible = "qcom,sm7150-dp";
+            compatible = "qcom,sm7150-dp",
+                         "qcom,sm8350-dp";
             reg = <0xae90000 0x200>,
                   <0xae90200 0x200>,
                   <0xae90400 0xc00>,

-- 
2.47.2

