Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B74B89E70
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F0C10EA0A;
	Fri, 19 Sep 2025 14:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwLNwrKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367BB10EA0A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:17 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JDs6eZ029526
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jjkngGlYDAm4B8CujfeVMFkJRW4QuQM6B+E9nbyKLy0=; b=XwLNwrKNd7S2G9Ag
 tVv/XivBG3wkM00x1URxUr+16xz5hvEjAl7txzyNk+DVQ1O1fEAmL5ANBNNsO+uu
 SY5edrw9DW6kJnNdXHZrZGg5AGydVyo0Pc6ABzXIE99ETlqOB3rtstNRrwxSehMq
 d4U49c75//MU8W/Tm3R1XwzDwRBFVI8flA4j22L81MaAz1XQM39VXEmL2fCCT/y5
 4eSAgOYaPFrk4F7u2J1xCOTLrteq7kFtUtVMlyslw8XXWqxi78MzRnwUOQbVqMT2
 Uux4E0w7v9Y9jURrFbStxhhbOC4di72lmg9j60fRuWaj/lUadUDeoi7J48OtMm6b
 yDGV6w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy12pf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2698ede62c2so5949545ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758291911; x=1758896711;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jjkngGlYDAm4B8CujfeVMFkJRW4QuQM6B+E9nbyKLy0=;
 b=v39sowoQMlhG8pijwpyWBYzWBW6SwJ/af0rLykdfnom2j6H5Z4z5mMA/u35mj2rzq3
 MlLWzXeC/IXplN0QRQxPaNtuGc7exIrz/MZN+6Jg+GgZbMEu2BMSQCDpy4xUXcgXSTc2
 /MDRU+Qk64XtOupAu41HehUhIiKBpFOWVr++h95/b1dF5N07i8zVLuFKOJLjT44UCyeu
 wGfhtwO1DbOHgyQ1m0CvwoKQGxPvf0wJY9I9nXJ5iBKZVJePqWkNlVbsD5Lk1Tm5KDiA
 zUmigr1IDPZNsjFVDPjyaiANiXnVTLkm98GywQDd430x38wZpz69Th0MfZVKCq9ccHCQ
 sdiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM6GUWA7SmCAqX8yn6yRVX/pSrCsanHt4IoF9pTUWnTdpbdVPQGkQqApdEuBKhgOBzkiu9CGjBNi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvelMdYhynjvGIsGQjKlT4q3isCOPmHv1OyC3pgQ+2AMcBsHRT
 n51Fe40iKj2Qd8V52X/GithNAYOo84lGkvf1PnGeTC2rZuW/CGr716qVGcMG1smBdcfCykKRCf8
 +KPx1hupm/pJe0bjWeBSnPh9hfL/7Q4KKJbX0TpdAViemDsHNtdhZ6M5Wrr8QY6IKztHUmeM=
X-Gm-Gg: ASbGncvt8tcGAT1xa1XBfmbdAX9aayBjm1KR2d1KXhssCT/GQxNfk7A6kZ4d4HDfuLl
 g5uKvnQQhT9Y1KraPD4RZHNs+OhdS4U6w4LzdjWY6QnvLQRQfoM4m2tIqlxJs3qGcxrpLaqWNOi
 Iyglyg+wr+lfFAEP8SyGZ4AowSM70jQQKx1kxVtCJOmJYy0cnlqFRtr2C1IOn3RQIsiJ/CxUUkl
 QKtx/vyYWjRK+ciM8RZKZJEcCcPQrU/+xJsmHoyrIj0mA8djHwjt6z+iw6hkOVlznU0/HpMfXZQ
 na3rCZdx1yDdeN0EZPLNX2yxGulFvEmrXdIeb5T8y3k5ac/wqNhC5tD/2L1EZz6ufK0rEJvgeu+
 M3ROvxB6MxcRZTA==
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-269ba50450bmr27749355ad.6.1758291910727; 
 Fri, 19 Sep 2025 07:25:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNdp3Kcohgum9P+lZ9uer4C3QWn2+bzqgb/I1lYBtm+XMAJb9HgZWehfhr8J/pRPZqfU6JUQ==
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-269ba50450bmr27749045ad.6.1758291910184; 
 Fri, 19 Sep 2025 07:25:10 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 07:25:09 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:18 +0800
Subject: [PATCH v5 01/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-1-eae6681f4002@oss.qualcomm.com>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291893; l=3530;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=LgccMGQtMns6i0nd4D5JzFa/u0XEgWzMdMJHz1iq7Mg=;
 b=RZ+pfI6lFlal5bTRELifiJDJOmNfSXOrbV3GmlnRc2mTgli3PLCghwRB5J5m50K8n1B+MODV2
 XfXIoGT1Ml/BuEV6FMILLRv1YKYgdDV2m82jRmd6HmmA/ON7VD3gTd3
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: zufPk0Ja2Lg88frUJOsbkHgXJtWZOrB-
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cd67cc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=z8W1oWq9hX_DlPyfQGsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: zufPk0Ja2Lg88frUJOsbkHgXJtWZOrB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/9O0zvev5u91
 yBdxXO7wKjifuB7astlwM7NPOhVXCJeoMfM9icLfI4mQp69Vf5MCaZWc3JDda9ZE00kAb1noiDF
 D1wZSHltlzamlPVRYn6o6AKbawO4/O719fZ/1gqBhqBjS8Ny3P+BqRjwrXf1LHBpz1gj0rkuxQd
 +gGCfkUjSn+7yUWC/KP+ipbrJbC3iZaFOC+MxOKLaaHtai202fGV+Whrje+CoPglTkQ2vg3wpzJ
 LzlGu1Eo4tfFirm6Q6P1+n6HJxfd4QQdfTra68/qyru9GkPM5vqUINvrnB5prum3vyPU0YLS2/j
 Y5DQKTR4isbROL7VD9VpZZcaxlRfDKg/HdYo3H0YqpVMA7+vGscpLtPRIe7pOfiuP2+nixbP+2o
 r+BIhiM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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

Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
on QCS615 Platform. This PHY supports both USB3 and DP functionality
over USB-C, with PHY mode switching capability. It does not support
combo mode.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..efb465c71c1b5870bd7ad3b0ec215cf693a32f04
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
+
+maintainers:
+  - Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
+
+description:
+  The QMP PHY controller supports physical layer functionality for both USB3
+  and DisplayPort over USB-C. While it enables mode switching between USB3 and
+  DisplayPort, but does not support combo mode.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcs615-qmp-usb3-dp-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aux
+      - const: ref
+      - const: cfg_ahb
+      - const: pipe
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: phy_phy
+      - const: dp_phy
+
+  vdda-phy-supply: true
+
+  vdda-pll-supply: true
+
+  "#clock-cells":
+    const: 1
+    description:
+      See include/dt-bindings/phy/phy-qcom-qmp.h
+
+  "#phy-cells":
+    const: 1
+    description:
+      See include/dt-bindings/phy/phy-qcom-qmp.h
+
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: offset of the VLS CLAMP register
+          - description: offset of the PHY mode register
+    description: Clamp and PHY mode register present in the TCSR
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - "#clock-cells"
+  - "#phy-cells"
+  - qcom,tcsr-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    phy@88e8000 {
+      compatible = "qcom,qcs615-qmp-usb3-dp-phy";
+      reg = <0x88e8000 0x2000>;
+
+      clocks = <&gcc GCC_USB2_SEC_PHY_AUX_CLK>,
+               <&gcc GCC_USB3_SEC_CLKREF_CLK>,
+               <&gcc GCC_AHB2PHY_WEST_CLK>,
+               <&gcc GCC_USB2_SEC_PHY_PIPE_CLK>;
+      clock-names = "aux",
+                    "ref",
+                    "cfg_ahb",
+                    "pipe";
+
+      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
+               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
+      reset-names = "phy_phy",
+                    "dp_phy";
+
+      vdda-phy-supply = <&vreg_l5a>;
+      vdda-pll-supply = <&vreg_l12a>;
+
+      #clock-cells = <1>;
+      #phy-cells = <1>;
+
+      qcom,tcsr-reg = <&tcsr 0xbff0 0xb24c>;
+    };

-- 
2.34.1

