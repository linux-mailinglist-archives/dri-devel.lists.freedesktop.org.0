Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0448DB0D29A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D10F10E5F2;
	Tue, 22 Jul 2025 07:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jA2DS2cn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B7010E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LMCa5B012550
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 95HJf98jrYhdOK50h5t/HTsn+deQ8bx6DN868zwIVWU=; b=jA2DS2cnWB8l7V+7
 ogovGQRFNcB+J1U2DHnr6lCDgPuP+LaiSlHoY9OGragpXdHErAz5aooOIGibHDz7
 lAxWJCWTqQVC9Fy4lIVdLmzs7AeNn4qZ6dMDJu5LahAW3WMrtU6zykcMOJu3e9ye
 YnnG2YS0+AHnYDN8V1rDbU8WAC427KpQ/znWKBfUhnoRGrdP9z1E0DwwmPjsjlGn
 g0WK5/4Dh2bR0x6Nq3PjEyY5SPi71obxzceQpxdnremrXZkrG7ij7lhgJlZbWltG
 F7Dq9usQPg2ntgfCtsggjoyMfyIbrna6HZwrCZCrnASStYPSCbSajRAzBALJ9cWn
 AcEWrw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6js9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23c6ff64067so1614915ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 00:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753168965; x=1753773765;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=95HJf98jrYhdOK50h5t/HTsn+deQ8bx6DN868zwIVWU=;
 b=kJRNDSZImVadlmPPE7ZUKfk2ZlTrmpYL5iHFTwKi6ilCOT6B00cQPCsnldoTGiW6BH
 BUo3F3jtXBKapujGTOzqWHKvHEFLtkDcXlYSXckmwFYCjlfvXoFcW3MMUoaZ9sFRy7On
 wCa3EYb9vwpVl7Lsn09Qaq/iwAHTKScT6L3qgMNreS1vqH+G2f9dECDiXDYnDxjw5eo9
 I6MrMrSgOtAK669xOds9ctzecBCByei7mcJjllhL8k1F9SZf7Tt5nCS3Ww/jwfojDUiA
 2yQf3WVGGi/RmonGNg3qWjC1ozAitOH9fJ8MndKE2kR5vvL3OI0O4nbRp5FVXJ4Rkrp9
 bJ6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwcjfc0kzZEi822+wxD5wHb3WBSd0JuGpwwpTg1B88bf9ZyOnnm+BkAfXym7fXsWWlyU0vKzlr5IY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ3I4tUPmvK3c8yc5P6ArJ0sZyoshjpaPpLBuoKb63NU41Jsuu
 PoXZGkKr9ZcZhwGbkCv7SWdv6ttkLx9G1zGVgRduJtVlVAF6xHh7eplPfLXyyHP/mhRvqRlewHq
 sQyIgmrKS6BoEpDi2pD538XZWBSVtyQJLLZjprAE9DKOpri+16z2SlrfuwZyy3fBrztD3Tns=
X-Gm-Gg: ASbGncvg1FylB/Yt5Rk8GE8uZ7U+z476LxmzEqGOIJ5wgkiV4Ou29XjIIsBVZOZWeGk
 rnNDmxDypWMoySa5e1g3EU2IRr5ctuOVqBBt40HPKJ14Xz+KWLMT5BozV9Z9quCtxupTXR1aAa0
 jYMIx81wzY0T2bxPoYyhlzDtss2Kosi5SynsayRnhCKPjf9hfpJapoVRj89O79AgwFoEYZYmNU8
 g1hGv4ZL6c/3+6qyU/DjcKq6f8xurz0LDq9O4UlZ7y6SKIM1bEoTR1gyvGKBEZtXWVsAQOu5i0H
 VXgWMSukLq1DcMXklHj1gb77w25L0mik3vkyq8RWh+MaokGVjD4e+LNP21dA/YblTpt/MKXuNI3
 7F7sv7c7JUGbJ32nPfpON8Vc/oFl8OYrBSSukSeuOvhcfnthT4s30kaq8
X-Received: by 2002:a17:902:f547:b0:234:ba37:87a3 with SMTP id
 d9443c01a7336-23e24ecc5bdmr132166305ad.3.1753168965173; 
 Tue, 22 Jul 2025 00:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG70wgcxv2Og+kPKUjYru/eTK2MCHabUKt0QBDH4BfkImjNq4j8b/P4oRqYxZYzHj6XtGxz9w==
X-Received: by 2002:a17:902:f547:b0:234:ba37:87a3 with SMTP id
 d9443c01a7336-23e24ecc5bdmr132166155ad.3.1753168964744; 
 Tue, 22 Jul 2025 00:22:44 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:22:44 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:04 +0800
Subject: [PATCH v2 03/13] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy:
 support dual TCSR registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-3-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=2537;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=71nsNROW8nOruef5bHMWdW3ozXU/NjQImv6aKmL0T24=;
 b=dLa0B1WM5pUjkW4SwnkHpZoEZpTLwSATWGvvZEls9+EyqvaTXc0lRt/0UyqWmrJRqq5wLe/z9
 j/MpgPhJxb5CZpHDFqsNvkHX+TzWVnCqfLppugMnbDEfKk+5I/8/cZX
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687f3c46 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=nxDEYaoXc1MktuKintAA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 17n3mABv9BuTY0KSiCwDEvVzwxUOByOT
X-Proofpoint-GUID: 17n3mABv9BuTY0KSiCwDEvVzwxUOByOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX7dCGqHjWIlub
 Qh35OUHEUA+aKmpwoQ/zUAcClLq33as4EkXRNnIFckyQ5JjKCnu5mlesFDSuAF9bS/uzz2JUpkR
 mlpXN4/oQRWqjaq7gHVQ1EyVnGS2EVDWIZf+3bz4StuFTzDVj25SlaGk1FyvTY3Ud6cD2yK/kwT
 6W2+DOajjZRy3QhA0G8IKosNKa8oIXjqhomsUkSwby1hunn+cJZ49O5N36GALWelYpX6+efea0t
 2cJt3GXp5Oij2TacRDCRwq55jsrjZypZnuhrCVVxr9yjHcq8HB23WB5N7mUnisRv2LehOBroajB
 o2K19apnJxVFa+slggPBoVkh3RBmqbev5sgpBcua/JOEAfE+ouq25ToH7sSg+wd7ctbtsy1bNeI
 MhvDFINXcyiTnGJ1gLWl/MVjeJS6UqdJCJM9fgkcg3R9AFF4xh6e8K7iVRDscSwpFY6rBt9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059
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

Add support for specifying two TCSR register addresses in the
qcom,tcsr-reg property to enable DP-only mode switching. This change
maintains backward compatibility with the original single-register
format.

Also update #clock-cells and #phy-cells to <1> to support clock and PHY
provider interfaces, respectively. This is required for platforms that
consume the PHY clock and select PHY mode dynamically.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    | 28 +++++++++++++++++-----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
index 1636285fbe535c430fdf792b33a5e9c523de323b..badfc46cda6c3a128688ac63b00d97dc2ba742d6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -44,13 +44,21 @@ properties:
   vdda-pll-supply: true
 
   "#clock-cells":
-    const: 0
+    oneOf:
+      - description: Set to 0 for legacy platforms without clock provider
+        const: 0
+      - description: Set to 1 to expose PHY pipe clock.
+        const: 1
 
   clock-output-names:
     maxItems: 1
 
   "#phy-cells":
-    const: 0
+    oneOf:
+      - description: Set to 0 for legacy platforms
+        const: 0
+      - description: Set to 1 to supports mode selection (e.g. USB/DP)
+        const: 1
 
   orientation-switch:
     description:
@@ -59,11 +67,19 @@ properties:
 
   qcom,tcsr-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
+    description: Clamp and PHY mode register present in the TCSR
+    oneOf:
+      - items:
+          - items:
+              - description: phandle to TCSR hardware block
+              - description: offset of the VLS CLAMP register
       - items:
-          - description: phandle to TCSR hardware block
-          - description: offset of the VLS CLAMP register
-    description: Clamp register present in the TCSR
+          - items:
+              - description: phandle to TCSR hardware block
+              - description: offset of the VLS CLAMP register
+          - items:
+              - description: phandle to TCSR hardware block
+              - description: offset of the DP PHY mode register
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

-- 
2.34.1

