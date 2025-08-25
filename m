Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5B2B334A1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 05:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6E610E2B0;
	Mon, 25 Aug 2025 03:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fh4KurSO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F20D10E2B0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:35:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMafdg000801
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OZg83hCdtMCdsj3A6OZC0JX1BgccRkDWTc/mnL5LnSI=; b=Fh4KurSODOa3EQrt
 dHbbZmlijp7FN0kX/upao1z7v1quR30bPGFp+oiG1YbqE5SuyKpIZ0Efk+P5gTau
 zZvujRbFFZ3OBhtthckrPwCss2dIFCe7QmIvhXK3FZ5tL71H6JBGp67LEMJcYvnq
 ekRaf3k4ASBuHfbro975Q6cMFVclN84dLq9qK5gi2bACmHIorBh0EnQm9QhnpKmH
 fK8J3IeMIkP5xeSNl0A7oGshoeQKV8+fMD0aRzndLfqzYfStGxpAE+n2gT6FfLtW
 XLJiUJGekz+ydyae2s9wppZpMNUIF9PvT/25PnmtEVXK/Zs1vTYJSw1PI9ljuFlY
 k/FMoA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpkkyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 03:35:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24458274406so87077595ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 20:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756092949; x=1756697749;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZg83hCdtMCdsj3A6OZC0JX1BgccRkDWTc/mnL5LnSI=;
 b=P6HoxHehTDXGRT+mQwKwoGFP5iuXVsXa4hNsSgojMdbvCaTXZefthW1WHpoz/DTgyz
 Kh3sD8IC/cUX4LYU0tVObIVIjWc7QvtU784PvWdEPeNzDRZF4VlfXSEwHGMD85X2NAms
 i+3Qw+0PT1vH2E7fB49nGUM8es/K+5kmor0XHfuLCm4uAFpXh+fmvQTBb6sYF8PNEM7a
 GtAkFPbbHNkfsdU38fdKKj5IddXe94B3Les6QYB/0nc5IvZqiAyo0B5hg5+mx5vmwQd6
 dzgQ9cWlPVn1WxUjrgImQbAUzTzNwpYjjaMX9JQ4vO/VzPaX0Jex5SZ/KgyNeseZ+i7h
 F6Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJiAe4p98YKHvFto++GdqjskKXYKf01VJMeEMQVVOCB8kDPF9Gi6EBeL+rT4t9LDtr0xvUr4SFZu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySxL/SCEfiMSq9fAfnH3XEahHo+Ry8I9wj2im7c4V/9mpyse4L
 yGdyiGSKM36OgLxWUBv7O4ezDlthH3nS2mEra1zxAs6uss5wRNQ/pZ8GHVNCRQ2Ur/reKrQt4a7
 kbHlLUHi4z9Phw/x6CdcG2DjuDjInmTrKxAyyacfWOHfOrqtMttgVYw+TkbIrHrl0P9cJ0Zc=
X-Gm-Gg: ASbGncsHTvZhs42InqDYLGkTOlvFl981knj3nBLvgZf05+h8cuX9QfpUZuBg2SylJ3l
 eNBqc4b+g60IUkjdQnBCJLtAFUrlgsbAUPPyFVdogrY5JW1jyeYAeuI+mQwTRf1jzYME7UW7Ilx
 Qua3zgHbSL22cZ/cKgoPjILRd4v8RCnYkeIO3Dcuouopb2v20uR5LLWCJGGYn2cl8W4FsGFDqus
 DK3I9oJ7AzGpHgVLNLwzQD3Udd4B7RZjl+1G9KNDg28jN/jebYPmJ/83YKgt+Ec4abjVvCb6OUd
 ixQUY6xZzQiFtTcDbYdBGwmVDkdghN054VgWdm78PzyQiBNYytdDW8DoUZcymNaX0n9IM50=
X-Received: by 2002:a17:902:e847:b0:246:e621:96f2 with SMTP id
 d9443c01a7336-246e621a7f1mr14024225ad.31.1756092948818; 
 Sun, 24 Aug 2025 20:35:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAwYYh6f6erS5AzdwM3CnzPO5hhkgBPJrkBabrpVRyKaCiZvK90nuAoQsSrtjRliZmm1vy1g==
X-Received: by 2002:a17:902:e847:b0:246:e621:96f2 with SMTP id
 d9443c01a7336-246e621a7f1mr14023855ad.31.1756092948375; 
 Sun, 24 Aug 2025 20:35:48 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 20:35:48 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:21 +0800
Subject: [PATCH v9 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-2-ebda1de80ca0@oss.qualcomm.com>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
In-Reply-To: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092926; l=2062;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=LBoCkIOz1nhLErv2TZjqow4lrif4gDacFutX3m6t01o=;
 b=Y+yHBkF6j80VW9ppElFvbvtjnk+nZ8Ffhpo8+67cKLzsDwk48Y5mh2s5hr8gMEoFRRIrPcw8u
 +7JcJitAwSyDuIAeqQZXYBlerGqmU+wJBEBKq3NyyCb6aTQPzN/Axvj
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68abda15 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eRoelbRBQ5ypv8gDxK4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5d64R1ulbMVCx555KTpna7R5zngb6pAM
X-Proofpoint-ORIG-GUID: 5d64R1ulbMVCx555KTpna7R5zngb6pAM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX86MRvGofq8Ha
 5ssZYVmVh/UfGulxzYf2WGxyia+uDgKfQSL2DYiptFy/1SH+VaMQ/M+G/3A+y/Nb8/vJPP3W53j
 uUz72QxSVa2E/TgxwZOwkWXfXLpG7M3mHRoLHlEVwh3mD1xv/74LPBF0KSdvAK8IuJCTYtmfQTx
 66JRUI4b+jI7v/w268kXm8mRkljIQR+GouyLQSVqbmnnTtbsQA2UJhp9DSw/14q+Z3nKJvvrzLo
 slMi9uGhFCgYbDTMz1bk2sM5sf2bGCJLIZZrHDMlEuYDbO/Hf1CH0iJyqK8UmYNw3DSMT632jfL
 OFoXpFKfGAqaMgbrcATW5+LqYWim5sFhvWMiNxGyJU+QDrapGmdcX6uIZA1giBlHQm6XZrahq1Z
 ZnUzLwdg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
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

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 SoC.

The Qualcomm QCS8300 platform comes with one DisplayPort controller
that supports 4 MST streams.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 26 +++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..4da22a211442b7abe2dc18e769d8fd14d224eb40 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,qcs8300-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -179,6 +180,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,qcs8300-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -241,11 +243,25 @@ allOf:
               minItems: 5
               maxItems: 6
         else:
-          # Default to 2 streams MST
-          properties:
-            clocks:
-              minItems: 6
-              maxItems: 6
+          if:
+            properties:
+              compatible:
+                contains:
+                  enum:
+                    # QCS8300 only has one DP controller that supports 4
+                    # streams MST.
+                    - qcom,qcs8300-dp
+          then:
+            properties:
+              clocks:
+                minItems: 8
+                maxItems: 8
+          else:
+            # Default to 2 streams MST
+            properties:
+              clocks:
+                minItems: 6
+                maxItems: 6
 
 
 additionalProperties: false

-- 
2.34.1

