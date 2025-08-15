Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DC9B281BC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 16:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5025410E060;
	Fri, 15 Aug 2025 14:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPOu+Iiw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DC510E060
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJAvm022207
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=; b=bPOu+IiwDjR9ymdP
 FCWKD8+hJeyFmM9yhn7JopBQPmbzuGNIw/ntcZrnpqVTbdcOvwHdRvU33iJO+D8U
 EnUBL3UqKG7Jg21avuVTdbFv7TSq+P29tfXwSFFXli7zWXmYkiuyfAVlB6vTtP3v
 +0oUohe9Y65RQ0aoHW6O8fE4RYB8/ubrTnFHsVGTQZsROip2nFARPa65WcQaz+i+
 8gC6vKQ+wA1lJ7wRxZ5NAp6+WkBtHQyBPavdhszVhLxXEA8aXOoda1rNSlBftpsE
 Mlqi41x0231Rr91JXaGk2iH/xlMIx/nDhISvRvpdAolDTWZwuvCsktk3PvADtNmi
 5rxtqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmk756-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 14:30:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9289baafso39483596d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 07:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755268239; x=1755873039;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=;
 b=VKQvS/KPvEDIBwQPVh11AyLFVcVdg5CkdrSox/jn5FUjjdcnHt3c1dgvRe+xhv96v1
 uovfTOaxHo9tJdUn1kuvEEywyx+YKBlgmw6Ts6p5BC7CQgfYpFc3M4FwuNICKNVMeYI7
 B1ZbFuk6f5Kmsk6SpnQdFEx3wYktJRoWQeCGIAL6WzuL1+NrCA1iIEOy/GgZvA2kFsnI
 UjrUBA4/XiF5E0iSHuShjRwDd8dB92+ntMEtc7eSsH0blA3UlKS3yp1WW4PPJeisa6Fv
 l5FNKzV+YWGb1quVx9W8aZfW2m4IygdHn8f4LZVVEY0LtpyIv1GJHDs+i5FKwYjZCg2W
 g8BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCIKFlvD1xiHcp+Wxi7ZuAv1d1NDoxiSS0xFBJUeMuKyXlWKawydHQ/uZxaHPysetO98v9UDNcYao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxKIMxFzbe6FWzziCwnQvHlXeYERFly4Vjxlnf9ad2dHEkr7ay
 ndaRui2D6M7CwfD4yxHBJLyZ9eDH1S5c+YcLZkBSwqapxf1O+Bich64hHfB4KhxeL5pVWaV6Ik+
 /4sCnxtfBa+AQeO6ryT88S1LWxhT4WCEutOVWWmFjGbsyuAOrQO8UB6e9AKuhqxXBTVbgt6E=
X-Gm-Gg: ASbGncs637zq3f/zvBrSM4jiHFsSrnwHBKoVM6xiksfvzvek3vv4KvX5EMUQEld5Ag5
 otXjmdWE+EChQEC0+EvsXyq1w777BbXLwEYnkPxufGflq12T2Pe64HkTBF1xJtuaIpBTrI0kqAc
 l+cH8KOlCOB8eXPBF4Gd8ez6NTL5WrcQtN031MKsMDHUxvcXjxH6wsaEkPoYKyMisq+80DRVf2x
 gl5OCGkK9/8oqBeizuo6QxSiIsv99VlUCenMtraw5EOdt+UoRDa2PgG7mvaDSiYxxbxnQhjaXx/
 OWg6nWzTY+BN4C1TptHFiXSpikmLO6BMurZQcX86ppfIgt8J9TYhE9LibcIaXKpt4Inzb3qi38i
 5318Q+3RNqL/a7xxmcEvUyEWDyEKEWQ5sM0BquipaZi8K+ffIh7LD
X-Received: by 2002:a05:6214:500a:b0:707:6409:d001 with SMTP id
 6a1803df08f44-70b97e3bb48mr87498616d6.21.1755268238370; 
 Fri, 15 Aug 2025 07:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8ovjWbOs+92uJ739mohecs8VJyDODcJr3savSKli3vBqXpsZ7ifXXVkzwoE/LbA7woPJTKA==
X-Received: by 2002:a05:6214:500a:b0:707:6409:d001 with SMTP id
 6a1803df08f44-70b97e3bb48mr87497976d6.21.1755268237808; 
 Fri, 15 Aug 2025 07:30:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f358bsm305661e87.110.2025.08.15.07.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 07:30:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 17:30:28 +0300
Subject: [PATCH v6 1/6] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-dp_mst_bindings-v6-1-e715bbbb5386@oss.qualcomm.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mg8cF8dtHa8FBVVXmu7mhjOEv6I2lafX52Q7aTfQdic=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon0SHXLVyiyAWAnY+ykHy2ruSRC8nKRZgnP/Bn
 xINi6OKiNKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9EhwAKCRCLPIo+Aiko
 1etFB/4oS7mGdVAc837H48kHj1jUJBhQYGWrSf1sRZ/FqGtBZdkV/0jyuAAoP2duffnj+icLPyl
 2cjqsaEIA+4jfjhEfIw2ZWPXdfrMUPu+vG0TNsohOGDIqFuT6NcSt5CX0sES+CZTig9vE+1AqlC
 SSo+BAHxWcXSxA2l2qhQtL+5g12gn199onkgcpBhUbVKIng9zMMkXwWgYqjXO6WFazboZ+xL3U8
 p/RzfBIlbZVh1npczR4Gc6udiMtTKIrcKHjbGy+S7UHf+UyqT0c13hVw0Gw4clDnvX4Vc8Itxoe
 3Mlwe1IUQDGFmbDtvqHg8r8VNR2ViQlQu23rwrDpPEYDIlP5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX7yDNzL0HmOuq
 32g8UQB7kFGZd7htPt7WnBTz0s6mfWeL+qH1UcQ3W6IFvhVCQXOVvP5tf4VZbGpnO4qbUNgAzGb
 0Ky2qEegtbdam4criQJrQ7/Idwonz6nKVDYrABhpQ9ZEF+mBrVMmqT6AO1qx24LHljK3OsDI3KO
 MXspldf5POAT9L9ywE4ol3Ero/1tP/AbwwK8/dsISJoMLXfL4wEWrPu+IKBj6mExdQhV2bTy0OU
 l7mxOyGN4RpTfylLaofCipqBYJNyOMeFSpx8CsP6yh0dlWtRpalumO8crlUIkibUHgY0VWI4WK/
 skRBLzWtY0mdCO2aJkTdsjAtAjfSUb0OzzBT+1s8SNHlwgxiGeP5XxrUdX9jMUqAmGONBKwdAwi
 EAJfTNi+
X-Proofpoint-GUID: xXFaaK7sjo50YKVAP_jhmroDEO9EaQio
X-Proofpoint-ORIG-GUID: xXFaaK7sjo50YKVAP_jhmroDEO9EaQio
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689f448f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119
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

On Qualcomm SA8775P the DP controller might be driving either a
DisplayPort or a eDP sink (depending on the PHY that is tied to the
controller). Reflect that in the schema.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml        | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 9923b065323bbab99de5079b674a0317f3074373..aed3bafa67e3c24d2a876acd29660378b367603a 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -174,12 +174,25 @@ allOf:
       properties:
         "#sound-dai-cells": false
     else:
-      properties:
-        aux-bus: false
-        reg:
-          minItems: 5
-      required:
-        - "#sound-dai-cells"
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,sa8775p-dp
+      then:
+        oneOf:
+          - required:
+              - aux-bus
+          - required:
+              - "#sound-dai-cells"
+      else:
+        properties:
+          aux-bus: false
+          reg:
+            minItems: 5
+        required:
+          - "#sound-dai-cells"
 
 additionalProperties: false
 

-- 
2.47.2

