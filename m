Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6DBEB000
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 19:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A201310ECAB;
	Fri, 17 Oct 2025 17:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="laJoqBTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E2610ECAB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:18 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HGXXji020167
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hqmiSi/EcNgLN8MIHk8p4XKaA97uQpMTNTjFIwpiBBo=; b=laJoqBTB9PkIZxTw
 ybi4CHmMyV/KgAZuFrPtr1TyPbXKBZLIe/DbGLDpfvCxgKtD0HW3jBIepzMBml4Z
 NgnDSNooXb2gPJ4yESpzHUBAboaDMQERVr7p6MRWFfTKJvsEmtGrL52NYGCZsXtj
 AinMl6x28NOOhnTOoDoZEW+LsXJuoBk1xLarj5NKppEBtM4MitIfOKUJ7lOFNrSx
 kym0/7HKdeat1IaDHIn+/Mh10IdjxmMSTpkSzL3OdpxYz12N+bYj+Eb13euUklqI
 uG/b+1uWtklgAomBQSqVaBbbizcFUEoljrlEsgECCYpEIQ/3ILvJAG3JL0U0uUaE
 fg5Wew==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvppfxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 17:09:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-290b13e3ac0so19462605ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 10:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760720956; x=1761325756;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hqmiSi/EcNgLN8MIHk8p4XKaA97uQpMTNTjFIwpiBBo=;
 b=YGOZ+2+qheXeo2AEljdAafkq3nKdhQEecgbunzRhwGbfJ02MV6K68sQq56Qyv9/EKY
 uHNXuQvK7OhqHhCUkXLbPtDAmLkBj6ffhkhg9CtGNLnh6DQduOpz02hqKJJwYVpKZpTr
 m8cGBFPMJOMMgdLDAPhUgqMLsdozx7NytVhLgSRFo0f87ju+Xnkx6PRiZn7a6eJFpUA0
 3crFsAk6wadkbMPfoBQOqSP48D1D5j6i+FVI7QKqq3SIuuNvGYzzILLExHpoOptM4KNH
 SS+Z2agabmQAVGA5Uuoi0F7nEWWx3y9qNZJA4YsX01ZBQ1mbcULTa9gUQKvXHXiiiStu
 l+0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMkRU7/gxIxdIn/aSQJ6iHBfzlNymCN5A5vOWP/svqeesLIvmnuFhX5eC7Yt7Qhha53xy2+cTKp1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyt6vJno/h54zQUcqK1uI9RyIm2idLA3uWmSeJK83BOb9ch+B4Q
 us8NWdZOuA1G6dly9qN6a+E4i7EgRAEUuyJPi7NlLISdqOFkDsYUTxlAOIwXCpOhglqxQACzIMV
 yEuYe4Rcb3AHbKcHn0wp5XQxN5EPZZvN1qxPBvQBmBF0Mkfy3uMa+l/sTp2tTbXFbmYD6onY=
X-Gm-Gg: ASbGnctS98AOrun4xfobBdlpQlRh6B1EGs9/bXgz7mhs6T+LMvlnodqIw2rSPVKed1A
 dAxX1Z0qIEhmfxrjhZUdm0NJUol+Cht8rl7e7iuPGfHyzmYcp1ck3xSwRmydRw7ydj0JW5fIZAv
 VdXMHG+yfAIoAZh/NX4eMTJUls5a1VQ30do9pmchklzHnyDX49LrTtkVa4zvcJyR+6PI2EFOWkE
 ChzVPC3QTGmsrC+g/63QuU3HyVFb0cC8IchWM2yx9cAxpf3X4AC+o+cTlzvFUxa+JyzX06IQKTC
 SksYIdYeBbMh+PTc/8TPVTUyYVEIGKLuKcFPtlfQ4XvkYXAfw6umOprofraJwLkhuK+vEiqcu3W
 X0zd9mLz2NRVhthGXjKayeZA=
X-Received: by 2002:a17:903:24f:b0:267:a95d:7164 with SMTP id
 d9443c01a7336-290cba42a8bmr43851075ad.60.1760720956318; 
 Fri, 17 Oct 2025 10:09:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECM4Gg19lRFs8Sa1aaNG9GkjYF95qSMpT0D7neC1fOINMo0JSdB6MFdV9osSiN02voYub3Zg==
X-Received: by 2002:a17:903:24f:b0:267:a95d:7164 with SMTP id
 d9443c01a7336-290cba42a8bmr43850645ad.60.1760720955826; 
 Fri, 17 Oct 2025 10:09:15 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 10:09:15 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 22:38:31 +0530
Subject: [PATCH 3/6] dt-bindings: display/msm/gmu: Document A612 RGMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qcs615-spin-2-v1-3-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=4163;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=sX4EE5hAcefL6V6eBB1BxZA4MnJW4trHfzsuBuA6010=;
 b=uIKWqinlgjkELumeJO3EaOVUmuZOe6ykmBwI2gz7iZFC2+LOH11T6sTLyL36mUQHk9TNRx3xV
 wVBlBw4BqdOCJNBAURiKsSCeETvn3FwR1OeOEmlmqNNQ6E7rj6PLFHi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f2783d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OspxmFM2CjPT0bdoapIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfX5ZXasz+O7irZ
 kontQxSksxnzyEMFxTBA90PUQPlRa6ysGEmi1Ye5biAYB8ZZOqqpfgyxGQhC0+DPGhgmDsOqJ3C
 QNRHyOV0kV2H6BzQiNUmWpwI+wE2IcmeXz+uQ6XZwVUPzriGeE8hkyPcILOgoXkWG79DEa5IREm
 nfI7A+17iOlau4BYTvuMV/+N7EfzjeE4exh1AbGatnyWk/WGrgSIi+KyC6Z5meCjrI3dJUnOAdi
 duoWgVcxnkLtrdsPCWlt4DT7abfJMpLZ6yr5WLSP/CC4zW9mgd5bYERr5qgwxBKf1QiEBq15o6U
 BhY/UUfaz2inMGodYPQ88JLWAKXSSpkZcPgLNhoT0TEGpWQrP3LNpD0T0VecK4TQwP69Uys6XES
 bYs3isuHzElap4kK/l3mvTmg2FPqTA==
X-Proofpoint-ORIG-GUID: lPAsaiasQDHezObeTkIBpcH347WVej55
X-Proofpoint-GUID: lPAsaiasQDHezObeTkIBpcH347WVej55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017
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

RGMU a.k.a Reduced Graphics Management Unit is a small state machine
with the sole purpose of providing IFPC (Inter Frame Power Collapse)
support. Compared to GMU, it doesn't manage GPU clock, voltage
scaling, bw voting or any other functionalities. All it does is detect
an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
it doesn't require iommu.

So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
schema.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 98 +++++++++++++++++-----
 1 file changed, 79 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index afc1879357440c137cadeb2d9a74ae8459570a25..a262d41755f09f21f607bf7a1fd567f386595f39 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -26,6 +26,9 @@ properties:
       - items:
           - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
+      - items:
+          - const: qcom,adreno-rgmu-612.0
+          - const: qcom,adreno-rgmu
       - const: qcom,adreno-gmu-wrapper
 
   reg:
@@ -45,24 +48,30 @@ properties:
     maxItems: 7
 
   interrupts:
-    items:
-      - description: GMU HFI interrupt
-      - description: GMU interrupt
+    minItems: 2
+    maxItems: 2
 
   interrupt-names:
-    items:
-      - const: hfi
-      - const: gmu
+    oneOf:
+      - items:
+          - const: hfi
+            description: GMU HFI interrupt
+          - const: gmu
+            description: GMU interrupt
+      - items:
+          - const: oob
+            description: GMU OOB interrupt
+          - const: gmu
+            description: GMU interrupt
+
 
   power-domains:
-    items:
-      - description: CX power domain
-      - description: GX power domain
+    minItems: 2
+    maxItems: 3
 
   power-domain-names:
-    items:
-      - const: cx
-      - const: gx
+    minItems: 2
+    maxItems: 3
 
   iommus:
     maxItems: 1
@@ -86,6 +95,44 @@ required:
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-rgmu-612.0
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core RGMU registers
+        reg-names:
+          items:
+            - const: gmu
+        clocks:
+          items:
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GPU SMMU vote clock
+        clock-names:
+          items:
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: smmu_vote
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: GX power domain
+            - description: VDD_CX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: gx
+            - const: vdd_cx
+
   - if:
       properties:
         compatible:
@@ -313,13 +360,26 @@ allOf:
           items:
             - const: gmu
     else:
-      required:
-        - clocks
-        - clock-names
-        - interrupts
-        - interrupt-names
-        - iommus
-        - operating-points-v2
+      if:
+        properties:
+          compatible:
+            contains:
+              const: qcom,adreno-rgmu
+      then:
+        required:
+          - clocks
+          - clock-names
+          - interrupts
+          - interrupt-names
+          - operating-points-v2
+      else:
+        required:
+          - clocks
+          - clock-names
+          - interrupts
+          - interrupt-names
+          - iommus
+          - operating-points-v2
 
 examples:
   - |

-- 
2.51.0

