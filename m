Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B6BB2D85E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 11:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2F110E6CA;
	Wed, 20 Aug 2025 09:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="israyspq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E7610E6C7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:49 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1pD6D007985
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /49lgJ2lsCfdk25hmebOHzPWeKmLJyq/ws+x1TYhUE4=; b=israyspqpbWd2wp8
 leQfCenqxm2845XZ5xLbsqfuzlVK+zU6/lRl0sCjKN34B0Iiaagf43GLo4kBa5t5
 aSb6d8MEfAOG6wSJr6K49b6UNI8y6QXrb3AZET286aM7EN8CmPLsm7C0oX2R/kTw
 qJkiwa68HLMww/eTBN3bKU1iIWJSV79eQr4PXwjcUgUOcgyI7ipbdKTxHsgRDVh5
 OzTqLBsMEzDx4si0I+FXl/7eG4JGZ1gOwkiVwfCE3QyBlWj0sGi/6CCf1iT8LYp1
 vCQBhJkYqz4aWAenF7AbSFB+DwvgHmvFUF0/poHBilaE9XOU/MxC8PKOBqnf/Kwn
 HvLk0Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291772-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:35:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b47643b96ccso122588a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 02:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682547; x=1756287347;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/49lgJ2lsCfdk25hmebOHzPWeKmLJyq/ws+x1TYhUE4=;
 b=L20k8mj4vF/1lJe4OUUqmC7qa3b/H7Nh0Ul8rP++JDtvoVSfqvmHOVNxiKKCEoLxoz
 6Ra7uAI/yX8IXGd8tEtr5vQr3ubHtmu0yev2z1wvS8uvI7LpCFLXMNJT8trzR+zn+F2y
 z49RG14Xi3Y4yi8J9XT7RFt6gWdopt2HNXwWetO100WQJqJqPA6s4O+f9Bb2SiUbhC4N
 FPfuga4Uq8Wplwafj4S3cY9v1Yh92pRKfoThedBPk6h8c7VzuwzCjh48rIpttFsKyy8T
 jrzlTy5yifjPZKsFi2zaZhqB6PyiMoaDCJPFemEVJVdJjwGTHptba7fXos2BMLFgG00Z
 I4OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJgdfosqz904nb42hT1xWLo9iwmi/TZafIOJ7swWtq92AdaIoCWxrrnEMaNh46V6zhNs3G/FLWK7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUnDfkx5afWAzZtvb/p8K5w8ZWFN+lXy/PJO/9cbiT8RxYjRi+
 RaCNKheZ7JhneeW/jLG0NV3hHShDxkdNYAgBCQM5XH6SH9vJR841kA4MZoW/X75a4MQJCRi5ba4
 NsKdajF+kU1uVHYrHcmU+Tjh9WnaOU5+D8UMZ9cDgOswIrXpYERsXRxtuYOFHIqnwu7Q69vQrC0
 rblxg=
X-Gm-Gg: ASbGnctTTAy9VXxbYXAh/+RxIIOLBz6uUA7Mai4tfAvRO4t5ftxbY3itlvxGnwjyHFH
 tfqCYoEBbuSWubSwwxB74CaV8HBgRQ0Ov04TwivIf3tdVMTGHxHaqUxSWV00h27UNHPcjEkRfY6
 jOVUVYeGFQxct+RVNoupIytwLZNwn6ypyXwFxrmFcW0X4eH//Qvkzi66oKcY4WQAgPGS/Q1tOTM
 gN4DbFEp2hyenrchE4iNeCFpYlQpZmPBuDbBMeCh7hwasrAqSSXA1876wP5qgZOiJ9wPxH9OA1P
 qaDIB9FIuq/98WVAOII81StT0SW8CvaDZLGycKhu7AsmtLILvzbcE0x/AItu/fDbuzHgATXIbXh
 9jPaZhZGZVGEuXvncQkNlpavTRWFJW/QV0UXfh18cAndNUd+BFajbcKpE
X-Received: by 2002:a17:902:eccf:b0:240:3e72:ef98 with SMTP id
 d9443c01a7336-245ef289590mr14785015ad.10.1755682547383; 
 Wed, 20 Aug 2025 02:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN7kE8X7szS3MCwXFpbr5XYPBLHKFwJ2wnJ+GWqlR/yDhGf6M8mCARQFC3BCAmxLuxBIVsiA==
X-Received: by 2002:a17:902:eccf:b0:240:3e72:ef98 with SMTP id
 d9443c01a7336-245ef289590mr14784525ad.10.1755682546776; 
 Wed, 20 Aug 2025 02:35:46 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:35:46 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:44 +0800
Subject: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
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
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682520; l=3426;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=955LdwJghMXcL5Oa+X/F1FbgTdWO2XwHgQyUzbm6CDw=;
 b=nRN16ajcM4hDuEKG4MGhqYaO9MQPThBPfr7/k5iQv2p8RAz3Bpvm3qgoHRjh9h0AQnJ7Lr8uJ
 zPjRkWKFQ6FDsj88aANvA9/ugZbqSMVWLWriyLXGLLoVvPm0Bkvhv/o
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a596f4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=W1uZXkYdwnJCVkvvQWQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 8cpc5_nE5Hu2WDPT0IjThwnjW-gidD57
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwaxpL82xJ4E5
 vSDquK5Uc+6Juzd0aWh3PBT0AFF6/uwLVRP6WeytCPhwpvotdzRY+czQieqJG0r1ZK9BjxhadW3
 liibLgw8UQonCi6aGaceuP+RCPTJjD2bBte3w0llKVONOgCvjnDeg9ZLMLjGX9lihu3vXsY1lnP
 qeQB611JSKUOzJDpsTcqpiCZt72rYyvO53NODd24OdjQIbZqSoIaPQKQVPgkZj4WhWAtOP1Dn8N
 GZUev1KAx5t7aM8qV5wXsPbF0d9oiDPTBie+1LJ0lUBcqw3eKwZiBlinmbkdSWkAYnbDWK+/6GZ
 1NhvIlfyMNwhMWcXcKKTtckps686Ce0LwuozouDPFAFyYyIrcSw3na6trTcQXOypsN8bJnukSkM
 1fbeNulA89c/8oyH00WuyxjXzVIpfw==
X-Proofpoint-GUID: 8cpc5_nE5Hu2WDPT0IjThwnjW-gidD57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c2b1fbab2930f0653f4ddb95f7b54d8fe994f92d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-usb3dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP USB3-DP PHY controller (DP, QCS615)
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description:
+  The QMP PHY controller supports physical layer functionality for both
+  USB3 and DisplayPort over USB-C. While it enables mode switching
+  between USB3 and DisplayPort, but does not support combo mode.
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
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: cfg_ahb
+      - const: ref
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
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: offset of the DP PHY mode register
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
+      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
+               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
+      clock-names = "cfg_ahb",
+                    "ref";
+
+      resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
+               <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
+      reset-names = "phy_phy",
+                    "dp_phy";
+
+      vdda-phy-supply = <&vreg_l11a>;
+      vdda-pll-supply = <&vreg_l5a>;
+
+      #clock-cells = <1>;
+      #phy-cells = <1>;
+
+      qcom,tcsr-reg = <&tcsr 0xbff0>,
+                      <&tcsr 0xb24c>;
+    };

-- 
2.34.1

