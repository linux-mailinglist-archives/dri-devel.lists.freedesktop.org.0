Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC611B2B793
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 05:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529A210E520;
	Tue, 19 Aug 2025 03:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXYv47w0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49E410E520
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J3NfFn008833
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 87YUgQQPTRuBrNxZ7K2LEM1CG60UDLM3XWSwUouNtgs=; b=NXYv47w0XLZ0etqn
 U3/ZFoJ6fER9zn/OS/id+PAInwM8cKfUDJAjFlpaHvoH5lSy0KMw4z6tuOp6tSX+
 VVedvKPrQFhU8vL3sn0RgIMCuSsmV4xcYgWuN4snxfloiO5utUydjem9fFLMpybD
 sy75WsyAzN1IQKDMzGs8Ao4qKijBrHSLKsNa0pUkWwg+ZE86crFnMfJCRnGgmnr3
 IUtj4+cP94BTEYJ/RpFJPZ4xFGDR/3SDwDNqSObIMmmUGEbz1fw8N05+ypoLKInG
 IE2zg4ifxSA6/tg9sf5Ap/IBA0FKBVf0Zp6hj4+L1GqfxBc2tBPWBtgxyUyMYsOX
 /8veaw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhagxyws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 03:34:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24456ebed7bso57479375ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 20:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755574449; x=1756179249;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87YUgQQPTRuBrNxZ7K2LEM1CG60UDLM3XWSwUouNtgs=;
 b=E2lhYBvMeIY5iIrirnigjNtp9zibPrzeHA/Thwm51ejuVAk3tBxJFpEWrxh30TEMC3
 PpbJaxDDueDEqev++E2e9v9elrmLiJ7z2S8HRwnwIT+9n6FNZWYqYex0gBB1yGqHfFYH
 3WXTQDZqNaFMtk2pgMAgiuTw2B9wQ52V2sdUhCBQiI977k5lMEWWz5oHyDMTTpIHpHAS
 HwwHKvAtDwmIJWwMRachMo2J/T3c3vt8erFKUOEybLFWW7pDEiHJSd6++Ya7bvVEELqz
 ITPXkgPsv/C7Usnn2d1MeDIS2AuMDV9Bx1wXx4vP1oa86rGAEQHf470sFqKn4N6k9BQM
 C9gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXrpxbBVem/y0Kt7AOqPK5KHHdWmgHgQTNlAlfFnIdC6mlTSZj9bhJPbJ/vIT/9pmWN0HQkSrMjCo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yycmj5IyTsowXscfX+hzyHD79fXi+1juyORmeluAyHtvmyxv4ae
 UOrXosiY6//+TmOfbAinP+a+rqiZss6ab3bZ/IwSBUjUciXAyiRlJrq4UNXfysgJ9X7unXAwUjV
 a6yDzYwrcPH0mkfrNCM3Mq7utZHTrW05s1YMrrxZ5Q7rzeHHzBt76mVK8w+1EMtc75MGqHL4=
X-Gm-Gg: ASbGncut8PoB1CNMgELXS2clei/CZbV8YihJo3XqJLDy0tnMXG9TfDUeKotWyTpXk2L
 ZvBYGpQORc4pKBaKPrCmKm5E+sHCrU4SXp8hrxJ6mv/x7c8wQzbv68Oe+32cnpXdQsvvZidDOYi
 yG8Oo1r24xFcbNC2/r5j+mqIdy8SmJh1H6lacWhHj21vV2nHm7Y2fYPNiDMG28uYFU5MunAe1Oo
 ciZ5VycZLQmyom3N6MUohFtJJykcTg+pmOGRMJgElmaD6mwU5wQvZ66ppi41mu9KWcXU9qlEPZh
 mJD3NiNEgVxD37Og4OToe7F94j96WuP5lb7COrgi4527jvwM/5O3Hla8/1l+XKC0HtyGx6c=
X-Received: by 2002:a17:903:11d1:b0:240:86b2:ae9c with SMTP id
 d9443c01a7336-245e0eb9d4cmr9920445ad.14.1755574448411; 
 Mon, 18 Aug 2025 20:34:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWhwpVUkX2ye/OZpyid0P3l7BJisssSc43x34vQBSucCRnkmKAQZ+uiuAr4SwQWZXnctibyg==
X-Received: by 2002:a17:903:11d1:b0:240:86b2:ae9c with SMTP id
 d9443c01a7336-245e0eb9d4cmr9919825ad.14.1755574447890; 
 Mon, 18 Aug 2025 20:34:07 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d50f55esm94486325ad.82.2025.08.18.20.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 20:34:07 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:33:29 +0800
Subject: [PATCH v7 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs8300_mdss-v7-2-49775ef134f4@oss.qualcomm.com>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
In-Reply-To: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755574426; l=1832;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=QnxcyA2I15PFGprmlotWeGRQtMp+i/s/DgtWXJl8lG4=;
 b=HqEhByeRXqiHzIa4ch2zSFoAWOuFImPKR7WmRzmAehg4nt/3hs/awQcKGG7d9aj/sMJR/gbjm
 N9IwfWrKqJpCn8AZWObN8dz9LM1V1Dk8gNhn6PcK0ozQwuge62KbNR5
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=D9xHKuRj c=1 sm=1 tr=0 ts=68a3f0b2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=TDvFBFFeHOCVSu0WV4EA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: L3vew5YJn9Oa1HW-nQcST_IufKaiXMbg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyNCBTYWx0ZWRfX6d4oG0qNbsQ9
 Z0Rjmxv0nk7HoU5p9Bxc5HG3DykYielrzO6Zm5NPy4ad+wHTFxDqimTXPZ7d+79kB44quj9mtLD
 9jMNcorcIb9onfHPK/z64712SG8ZAzIMwF4n+VXRN3iOy3/LySsgP9T4CROPj4LLh+Xa/x//qQE
 6X2sAQKg2r4LAF3KvzvYT0K3t/DJglgCKkqzn4uvkFf6+gw7sMkelP3tMGQVvZVCVQT8qFWsKQU
 YeihEeobhiHkl3qAzrHNM/tQnvRCDtflhy/bKmIFzb5St0Fmslu54JERyYlbNFleQJFC3TO8ZER
 U6uvEYanR7Xnjp/H4hOYY91+Rw6xW2TEcv6zqzf3ww1XBcRQF331AJOP0kTzcSsf+hxeEm88vZx
 lBB2h66Q
X-Proofpoint-GUID: L3vew5YJn9Oa1HW-nQcST_IufKaiXMbg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160024
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
with same base offset as SM8650. But it requires new compatible string
because QCS8300 controller supports 4 MST streams. 4 MST streams will
be enabled as part of MST feature support. Currently, using SM8650 as
fallback to enable SST on QCS8300.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
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
@@ -217,8 +219,9 @@ allOf:
           compatible:
             contains:
               enum:
-                # some of SA8775P DP controllers support 4 streams MST,
+                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
                 # others just 2 streams MST
+                - qcom,qcs8300-dp
                 - qcom,sa8775p-dp
       then:
         properties:

-- 
2.34.1

