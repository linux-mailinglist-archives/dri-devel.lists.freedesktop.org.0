Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C50B3ADB1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 00:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8431C10EAF5;
	Thu, 28 Aug 2025 22:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0Y2KGyf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D47B10EAF0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWecu013569
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=; b=o0Y2KGyfjiibXHyi
 UHvBhhr9jxTNElF9xkvZ4X+sHdGNSPl0hXxnKjesSzv093yBTrlM/BIrCNUTmwl/
 2OzZWaosrENu6C8wGf4F03qbY86yymv7jRH9QLb0+m5NX+ch7HpYFAqy415vKehl
 cQS8Dr2sy1du+MjRZDAPiqaoNi+Osq1kKksLyJyVyCEfT8qlhVPkzPC0JRcKGNeT
 FxmB13pRZP9dzagUQ7uksPuWUyF92hoBw84aGGmho1zI/wjhJlXwjLzxwcQHzW7l
 996WyGS6cYfkqCTwaBCh4BtWwRx39En9qkkRdycahWALxUpORj2MIzJGGam4CcnG
 hkMlSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5ssq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 22:48:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b2955f64b1so40501371cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 15:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421301; x=1757026101;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=;
 b=HZVKcOT7SaoNat2NryF30SgXxykDbr409tcaYkVkfliQal4owPsvvjS5OA4YnnIa0I
 0K6i9UDhoeAQlJ+4875craawMbzOUOV+k7WGm/GSTII/bz+eY0s0nNp4+ZdUT5VEV6Ai
 PPP7j6z5TjnjAiHEHWcMa7JnUQ6AHJpyf2jDiZLXjN6pLdxMmQ5aaK5Dmvqan+HqSkG6
 jZltIz0lLNaz3KDTjlXibLuCSm3Dfcogm1zQD7t3n9PU5+3Roe2lfcsTM5PKTroznXA1
 rClPsknHDjMB6VXXn3NXqpDBzmu2Xgx5Boh/42LgVC2jixj4tJ09DyojISa9FGHFA6/K
 kkug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV77zIsXyEU8XXBme5IE428GM4P72HHTn6A+iikLFUTQgjU4w5Q4EvL27w54xuKVeipmDVONZ5qVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj5QicIt6OHYvYwDrVLUXL1fZIMw5rmi9skz8hsOjUKrDLxEAO
 6si7AQqAH3wVd18jSRDGm2lICplgNw3YSBpOUUCGSHSKgckGdB+GRAsT7th46ZkBM/pN5+YaAom
 Xi/bUAiRqMPuD7nKhNY42A5cnfWrBqT9P/F6wIzmLbcXI3IBow68lkb6UOQMJB5dnPAWL8pw=
X-Gm-Gg: ASbGncs4wPmw8/qo79+aPXkvui6pql5wjajYCiypbNPUIw0c8Ha6PL0NKbyVaV1DsEx
 LflBNtkZ/47uiw86dRpen1BrMCWgRlm7HFwuJqqDpXocijIXejnE5pCQKlaGtN7d7K27kjYn+YU
 0tKFpKQQjq1Bqcsrj47QURr3lzyfgrzcD4qTCmVLGjCzAUlvt37gNAAxk/UjcB4zTsN0lI8b4zx
 mGn3cnPxlyzNdEa1fZNipVqJrkrhtOfsU/C5/lOxqEhX6p+KqQ2bULMVATURrKtxt3YdShlEi2D
 KzIku93xbhwbTAhEwlFLIj8hjOeF4A6UGBDQlaUlnpZKbSiR+1XqRbOJVfXFkm+jn5nrnwknGMX
 Ly/QnlrcdXLrVp2avRSkiERFv8ZG4l8MVLStH0wM2Sx1IgU+TBUvR
X-Received: by 2002:ac8:5810:0:b0:4b2:d35a:70d8 with SMTP id
 d75a77b69052e-4b2d35a7edemr182346801cf.37.1756421301201; 
 Thu, 28 Aug 2025 15:48:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdoOUw7ATcWGp0Ua6IH6jvR/mrsJOnfEZJvEPJmeKyRsASOxjwEQ/HWMxbA6oMEFqxqL5e/g==
X-Received: by 2002:ac8:5810:0:b0:4b2:d35a:70d8 with SMTP id
 d75a77b69052e-4b2d35a7edemr182346591cf.37.1756421300738; 
 Thu, 28 Aug 2025 15:48:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:48:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:14 +0300
Subject: [PATCH v7 1/9] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-1-2b268a43917b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mg8cF8dtHa8FBVVXmu7mhjOEv6I2lafX52Q7aTfQdic=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNywCsqu73xOaKt7zEWE4x0GdbQNxrAI+KeSj
 JntiOFcogGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsAAKCRCLPIo+Aiko
 1cijB/9xZIf4Hhs5tcWo1x0n2SHDJulufkTbQaT32JWduvU4+NIjiogvLNlUCHiNRzYkmbnfiw9
 wdOKNlPthTIz7NqebuGtuOAUCOtSqjrChZvp6oVoM2lIczNKhyvqUmeJl4ZiMq7NXVbHGkVz0DZ
 z+iu3EW4P4hCn+/34/nU1sKcU8C+0jQCuuYZqjaFBnJ9KF1xF19aemPYflg1xWMUeZmePYtqA8O
 gAMb1VCsHmSsKvwA2jZ9fUj/+Zoda1bLuf05yCL3bre75RmncJWAmc2/sOiL+aBRCw4LekT7Dhv
 uCf8aVotEO6WN+Wd1hp2/+nKronI5uZElKvuVDGFCfcCPgP9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8x79o16Sw9nu
 CVM8QywJI5PmHie+bBzVuC0RiIdVbfvLAqbevK6oyw/a0rF8KWJW9s+7Y2mDxQH9ec4C8NYArbU
 Vxe8sDxgmxGbfc9P2/ggk6uCf1kdBLXZ/VSmEo4BxaFwwd/1xmTXVBRrZEpHV/p9twajzLEbIfQ
 SGtZQOsbTI6yqiWhsUbQYuKyKoa40lcZv/wrHnhP6jtkisXa3FWHlD9N/taJLiPUbJNdoXaTjhI
 +xB6YISJ8bDkAV7q7tVFi6b560vE4yCgtujkWij/Wgp+NrEsqDPu50sv6GUb+ylxVCc7Qbeeezi
 hKSMyVdiMjlXdJvGWooLkRq3dlkxfkCcwDUCJYefJo6/Pf+DcEU4K4S9KwaTSb2dhY52vKhECld
 QGm47gwl
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68b0dcb6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: EEW1AFI0xz_avZfZo8hn-EmcoaleR3Cp
X-Proofpoint-ORIG-GUID: EEW1AFI0xz_avZfZo8hn-EmcoaleR3Cp
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

