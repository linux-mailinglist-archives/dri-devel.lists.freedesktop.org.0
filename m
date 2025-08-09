Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97631B1F38B
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 11:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA71110E2B0;
	Sat,  9 Aug 2025 09:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fn5mIsbW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAE510E2B0
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 09:16:27 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793LnrB012617
 for <dri-devel@lists.freedesktop.org>; Sat, 9 Aug 2025 09:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VyXYRLJzDKBZ11ZVF0ZtjEW2r8lFG8npoaFqtCmnxaw=; b=fn5mIsbWRWgBpZsO
 OKqATLLR+TyK436b2ljC/4Azo3Ti+ij5pua8ZG7WMIft2ansSCoFgE0uVohJjzfi
 tldH5aIp6V+tnFu9mX5+m+9MVAcPzVkgsLiyG7NOUyYYDtSNiekF9x8vR4ua4tcV
 KXxnvq6X18BySJH6+OWKzI847owOFkOg0fuY0ocnF+Kdk9HPwclLNv8rVfEAJe+V
 sNkDFRMZtOMTw2ew9szwV867tB5tddd8B142lSYiIqknENzWi8b/26Bv0UPiO+G6
 cRj4P/mcRyfywwVIf2P0tddrLFg2ak5zg9IjhFH//f9MMS7D3IVckZMJlKyTGLOR
 QATNxw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dv1fgkq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 09:16:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b06228c36aso38820151cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Aug 2025 02:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754730986; x=1755335786;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VyXYRLJzDKBZ11ZVF0ZtjEW2r8lFG8npoaFqtCmnxaw=;
 b=OdeJCyVj34KW+R/wOTnr3vU78HBqPZt1r7zlpqSgNudMaDTC3Dh+cljVYBazLvh2+a
 3Yt9OvCo8niuQ8K4F/Gp/XCyAQRnhaoottt59pEGvVrvqVNqNoOJ9Wp3n0kQG+hUFK4i
 t11nq7x1H2jlviixHJTnwch7gfvChsK7w6HoHgYcTjd0FqFO1kExBBct4tx7VLjYWaaJ
 M5UWga9LlBAd08W3DrmqK0rUk0zzEX9OJjVqhjJWyFRjnp63rDNMevecuydMilh3wW3s
 yvuixO+QaeM3sxj/So4ArP/NT/QQgGqqirJHfBh1dh/PNQxg54Pf3m5wBMMQWDcPv7z9
 chow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhOVTcFcfugI6BobPCzaDFOwxiO6eqM6efYjKzkR1v+ca2FAJ6WWxJiG/e48z7IZsfrk+8trQCi5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTaJ38xPc8bFB0J2yUoD/tabL900IpqJiAtlGPn6wVtp0GEegp
 eOPyZHqPgOAISZkIZLDA+RGCu+HL4hMXWWl/4GeuM7fIVu2otd4lJaOuLyr7KFZHIin/QTTEUTF
 ts9apSS5UyEywra/s7fyphOQlF3nmTs8h/KGTUdqVpcEvzheRlAlzyVrLLMkXJzKETyfnHbY=
X-Gm-Gg: ASbGncsoarjqLX90N5YYF+w+3EhEgwe3cupJsSjOyMAxw67AmEIrf5nzBweEWiAukG5
 m++e+RicK5pMvznGf2QO/LO8p9aZU0cyxQz5/oBHQPWpU0MTZKZLtXmJiHEEst4UhxBB1YHmxf4
 QDk0SXFrlAXSjCnkDVHIOvSEd7Rj6G+5sSLTzJJQCifcE8Bgs0xJlG+i/3s7rSxKPg93bJvf1DW
 PJJDJ9dzDYudEV8vdKhKvEy26o1K+YFJh8VWs38nhF8WP5DyCNbrYAiEs6YAMM+hVaTBAbUNcqd
 X33XgmQH6YVrEjh7vCst4NtlFraF7DWBt4dLQ4Yq2WoQgTecjCJVikOX9jX/sf+VtN++ATGZT8F
 N5yuFJ8fdieN/tlo0RfI/aoqMxJgHt7jKr+HB1ch1J+zPdG4oaY+V
X-Received: by 2002:a05:622a:5a0d:b0:4af:21e5:3e7d with SMTP id
 d75a77b69052e-4b0aedd7c35mr96176661cf.38.1754730985807; 
 Sat, 09 Aug 2025 02:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbn+j3VRJGx8/ht60WZkPpDMpeHGZ9tFQkrI4f2soZwGGzxl43DRhjFw07MRX4FV4PJWf9Dw==
X-Received: by 2002:a05:622a:5a0d:b0:4af:21e5:3e7d with SMTP id
 d75a77b69052e-4b0aedd7c35mr96176301cf.38.1754730985409; 
 Sat, 09 Aug 2025 02:16:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beb4sm3361989e87.30.2025.08.09.02.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 02:16:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 09 Aug 2025 12:16:15 +0300
Subject: [PATCH v5 1/6] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-dp_mst_bindings-v5-1-b185fe574f38@oss.qualcomm.com>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
In-Reply-To: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
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
 bh=d48/C5oLUka5zAtODxq9StYs/l7s2f/Mtt/RsfxEURo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBolxHip3RY4bSc97JuF5htWVTzp4BE/6CgqBmbf
 WBSRHZgOw2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJcR4gAKCRCLPIo+Aiko
 1eVWCACl+QuJRQmjzmthSRPrrgvGLOXJ0Wa0bo/mvMwIgh5UXfoECTWXn9ZzRLyWrYMD+XY8A7o
 AGCR5SPempa60En1FGWeFtbIaMFOGlIhQopFJyiTT4TahDDXRQDILESmOiwsII+RNPJP3di5he7
 PhDCM2QtLByA2/sORcyeoOuVro0Kt5f7q810eEVE93KCtIx3HR+LKc0/mY5XvvQIAYYDz7qjH49
 vzqc82tcSqCFl044wQAg/459esVRX2YaOsFp0PY7eton9lIvTxxw2c8rIZYY4XFI1kijb8xQ6/V
 ZjEEiZ8EfsTji9pv6/+ZQ8SYBB/+Ln9zhkYXj6it7Oefv+LH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: xOS1OZtbaqCJWRKI70uDvgLRAG9D7R1U
X-Authority-Analysis: v=2.4 cv=cLTgskeN c=1 sm=1 tr=0 ts=689711eb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMyBTYWx0ZWRfX4575151tpIum
 OHHmH5a5AglO1qnxHK8Z/hxP+58sHSl3cFFQSBoqxjDPHtgM9fTZgCqMqXtHx84QVoiyGNukNO1
 +WvkHWKOzSx9bGDZK26xDH8Rk/OfiEqNTcBOpUsc/gC7BfRaA8+TRrlEkdkNfgj+OJdwJKHk5ys
 Srrx+zgT/LeCkFMNFuCrEROoErhpokLtkYfJmFeMLxEgh5oYUmv4WSemfBlwb8uFv1vTkai1WBy
 CYw3E2rQyNDtSoV3euZove1RsQ85KPRA1vPml2NsT/McNbFkI3LdcfA1EH6PvoXo0l6kNcKVOFG
 KDGKgxm2VybRu765ljR3LTRXxb8pBfEZJhe3PTfua+UDSAo6QYvLoDMPeqwIhYuqTS4tGaKPjMO
 92T1L/Ik
X-Proofpoint-ORIG-GUID: xOS1OZtbaqCJWRKI70uDvgLRAG9D7R1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090003
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
2.39.5

