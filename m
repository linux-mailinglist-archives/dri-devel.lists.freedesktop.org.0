Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BA1B41DE5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 13:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC52710E7B0;
	Wed,  3 Sep 2025 11:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQLw1s6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAB610E7C3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEvdw014079
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=; b=EQLw1s6Vwpk5KUvn
 5mZpuQBSCeTg5U8GFQ+9ZgzJWEGiCA20lsbVlPYYRjkrX+FI7mE8sJxxpVb2D25e
 Il7Z34ZyKv9EjK6ql9sU0nUj6hc0v24sbSduEET7DAlgsGBNTe4j7Xsr9UFTKs77
 xfNZJkFuf9rFvD6alQn5blSKbhUtClMf4QcXhIzYMglXYLuL3N0SjT334Dpb5IFx
 aG4tD1KoUouTCmzYteSayI4R5U+NLTKyQJgXixUlscJNEReZyhVKXt3mpGv3Kaht
 H20pT9yd3VjSA5sC5UEUVoSILHg1eHFgAd8Ub51Lmlory96VHhRbT8A8LzpT8Ae3
 GjQG6g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy7dwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70dfd87a495so116737896d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900703; x=1757505503;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7m1HwxzI8G7RL+o2tt5C5+jDIvVaSDVT2O8wP58iCTY=;
 b=SPQQTUV2PZTKsZiwXc+dEwvifLmbuj4ZePM/Y/NgoQYWYK5noOofLT1gEt4YbAc15Y
 DOo0hFuQq7FpsMW750YHKHmnDAxG55tuAo8auwyjAf8b8si+K3v/tf0ViUWTyq1E9p0l
 V5iL2xPREIyuljVa2pm9yvjsmTbpS9wrskm2nkcA2q2XU3aL0yqNdBNx8lhqAFK5IBlg
 yU++1yc2XOqj9q9efooA6KhFf8fXslmCh+WQJ6dOz1qNVKK8mzMI82XLUa9mHLF89wlU
 iPXh4fUKFLszTJWLO38hjnbY+pF/aZOkM8eGQXj+8xu9HHIqkWuxAFhfOf6HFUB4sNiP
 Q87w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpc9TE3ui8Za8kU+SskbJ72OQjTrm6+OK3CF4BBi4cS0v0zmGP536uL4OuGhh8bF9VOJwZdbaCJlY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZBjPX8sBIRpgniEfsVCdSiVXZb9/X9fh/T4KjL/EVtFdEgHCq
 ItYk/aiSW1wdDBrofQjegLlGQ2tlGmwzL9rLUQFPVFGXRcpeBVm8A49vpmQh0G4LIDKQto+Lv66
 Q9RVVBa+zZyGwejVYcw494LmYRri6xbHcWDxbRXnAT2ZCy49XeRWKReML48KGxbNoUH7jgOA=
X-Gm-Gg: ASbGnct+DS6IVwDdiHnMZArpTRRdiRaBHbKKuREkNM26xcV5re3CxRtgnEh5vhNj+3b
 TBwvXTMlbFa/4s42TN7CKpbQUNPcYvKXUfjxRC6x3zvibIkSHkGhieCCD6XSg+7dmg82jI822rv
 TsUSsMe2Ah1vJFZRGwLC0cTOd/Oe5aRSJtzSyCUSp3aNqYzONklf9waclSluGvGsbSjr5YCptft
 a2WrgJ2dB1oIhgcCFmprEonmmlmDn5zk42bqlgyEO3XaIA7kv7P8i9cqxmiR0v/omH0bnJ/NoBq
 qStBmcYfFb60EsiMxyeFDJfA5gcLkIGrTmeghv2uYlcIpnx9Z4tcR1C4gYXXI+VYO6Su5c+Sizg
 JuFUJnQTX+PO05ssp4U7RgOiRL7ljdeQFr632+ZWIktOir4WBnl0C
X-Received: by 2002:a05:6214:234c:b0:70d:c901:64fe with SMTP id
 6a1803df08f44-70fac883ce1mr176720446d6.41.1756900702735; 
 Wed, 03 Sep 2025 04:58:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj9hZcrJ+8S42PCt+RrOt1ShsvO+BYl52eMjU0T3wyJA35RFJjzM/AJCRPGUZH3504p2FyKQ==
X-Received: by 2002:a05:6214:234c:b0:70d:c901:64fe with SMTP id
 6a1803df08f44-70fac883ce1mr176720126d6.41.1756900702249; 
 Wed, 03 Sep 2025 04:58:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:12 +0300
Subject: [PATCH v8 1/9] dt-bindings: display/msm: dp-controller: allow eDP
 for SA8775P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-1-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1W1p9ibzzCWoQUIQX0KfzGSz/kKXFwqoffX
 NJj3hOGz9mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVgAKCRCLPIo+Aiko
 1XT3CACu1B8wHPkuKcAXGFd3QruC31bXNY0THTielGdmOfrW1fAonzUr3Uu2fYxVH5s7ghwg9k8
 68pHE89tztuW4b4bNgWVshbnNrINXf70tUF0y70xHDMIJ6b+EHPogOndk3qAcJUholeTSK9swx7
 PS0bFEobZk+VbXsh0QiVlHl5RZRmoSflDwsGA88Vs580Cch8RFs+b1d52zmEYfEbrB9siCkWGu6
 wRWaOfCtn/+iTtNQIvEdvLazeBoi5MsCrAu1KAgKEmvSuV3ObzYNpprUKesg1vr1uW49Fhj2U2L
 YLQv8p0o35kFJsMsvDISYVh8N1pcKQuVXLc6KYInBJ9Km+g7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b82d5f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iBDq5nSyD7x731avtJAA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Z2nfBR4QrJidQDlKrDPflm8UrBbSbWrL
X-Proofpoint-ORIG-GUID: Z2nfBR4QrJidQDlKrDPflm8UrBbSbWrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXz0UIXnC31gsR
 qUaDwm6x81T7JKJEeiQ2tXFEUE0bzsDBwGSgy+24d8eRX+20+ksnMKFdGOQK7Hv7OVxumuvULt/
 oQa3SnzwGQyGgS0vhQmrHG+LRIFadeZVwGDbVF8gDvGBfZ0zO845a7lkIAbGTnq5yVrB1TrpArd
 oRzUFLNhdCJsUx1qbRLSXAY/69xkcWCCazX9Eli+CSkFw2uDM/xTScA1zg5ILmsqwkhAkEBnZ/h
 +CuxNRCNVBy3uZ+GX/tAFNi6IPu/kp2R9Ys2fFz5JQdf/ulFkYd3HpvtSUapoVcXR8OWswnCL86
 ezLJWWeoizyY8X6lLzPQF5E2U7u6xVaUMSWqLf1VVouGf4QqQnfb+8P6NInDLZG5zvhbNMk+FxE
 krnn/aTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

