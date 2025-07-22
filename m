Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A15FB0D298
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572E910E398;
	Tue, 22 Jul 2025 07:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mf4mkhjW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F23410E398
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:44 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIg2dA013033
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ahrBulyU4QSMtpu0KlTx4RsdzzFchdneJBpLgEVdzls=; b=Mf4mkhjWYpBhxUp7
 a1GWkk/1Sv2f1IR7Iijvav/IbpXYD7zl+Jo8OcvO0tyel+KNhiQ93U2InnQPtfIk
 CuN5YjbpkNKHoUWfof85UgROFs90SHnTP/3XKJIxvtbwZPglGERQHUUU9KJ+2RC+
 nauv7A1M/O5JwyDto5zKuniSqra7m3bSubptfQCXzBZTXz9n9zk1c+/TCcdD+HUi
 +R1jueB7H/QyPTZi36qft4zopumh/helhl1mUJRJZyW1UDvjhzMiMYIbPO7JDoqK
 8U2PsC4hGIXjWnXnXdVmQYhA+gsYaQ0bG3DGISeIbbg17Rg4H1yxwpQbRH6iQniM
 0g18qA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3eka19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:22:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3131cf89075so1363618a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 00:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753168958; x=1753773758;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ahrBulyU4QSMtpu0KlTx4RsdzzFchdneJBpLgEVdzls=;
 b=xIyu7eH/S6djS+2h4aQoKnQ4cV3vSFuAvDDq/DcIx70dIX3Zituq7yrw2K2p1Iydai
 OQLR/kMO21WBdzIGf67Ultd0b8k5/SWMDrOX66I85/Mmqyc9/dVVZGSLPn6jJeOxqs9u
 XYgJfQpbKiCs5bIJz2Yb0BpC4Qjg4kekLh+ik4QThec3QLq75jxYI6mnEcJ54hnn2xWq
 AOjIql85cJTqW0ztBzrde8cW+Gl5pOYCBis84hAKKvUb4d8i3yISpZILvCpuxSz88NCb
 2DDLrClmpmbP7VEMgg/KxEdZ+yP9d79N32GTeyP4aFrqo+zpYGBybrW8b6uz2rnT3+4q
 P85w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKVdvV6yS7wXfjRR9Gp2eF1o0OLX/oT5VRCzTBoduxOOR0pUASJBb53+Vg7nnsXX6ZyJq6KQgd90Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwjrWmW2+j2W7SxItatnGVrOe00KZrP25BV1Z2TZ2HLJsvJZVF
 AN3GkN2bfAbYdB+8Rj4V+TxZDj8lykVxQfx7yQdgX0jPEzAdHg6i0qoJbUC60ZusDY+nbNaUKQt
 CfIup2lCdUnMzKVytoVwJODJhzJ9q+6XYxQFGYGVTB5CjicFQAt44JZdTCKCHvabOeYEqVIU=
X-Gm-Gg: ASbGncvB+Xv9GreFIOukfWM4RR+qb9kTAqp48vOP/enb9E+0M009b3bC6czUT1E9VCs
 iydxJOij48f9csrMAZg6z0h7My7T9IPFVmAJCQoG5x+E7gtInYDxBpHnQAxBvzHlrp4cuiutpnu
 NX8h/PYoYIyPBsvciojOB0nqbjL/8iO4xAj/mHzhBG/XZdOrKaF7GWxktFWqeaQp+gKSSepIuSA
 TTeNBlcOMPMUTI5fdCUaflYXbInfYs6rnywAPNvUuLNAXR8GlRk5VUfac7eWmtDhP4ReqJgvMCT
 0aGuMHmi56j2Hmi/2VWXC2dZvFBHX8r48jDjtMnCWA+pC8RSXOwoSTz347a6P/5o4JLkFeRgZ8o
 m+E5OP/woh+btlGmYS3osS4sSj5EF/7BP/bdicJouSC+nhu5/Q/12dK+f
X-Received: by 2002:a17:90b:1cc3:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-31c9e7767fbmr13067011a91.5.1753168958323; 
 Tue, 22 Jul 2025 00:22:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWj61R7/p9w0dDf3iRKZ2LE3OM4e0kwtzjTJU0dUunJEF/B4dIihVqiHHAlGGrq42tM3d51g==
X-Received: by 2002:a17:90b:1cc3:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-31c9e7767fbmr13066994a91.5.1753168957893; 
 Tue, 22 Jul 2025 00:22:37 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:22:37 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:03 +0800
Subject: [PATCH v2 02/13] dt-bindings: phy: Add binding for QCS615
 standalone QMP DP PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-2-42b4037171f8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=3578;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=UDTnjCmveSMGSp/9NQ1xFqa1/QflcdbQxJ1GccXnTeo=;
 b=YoL+Xx1wzPD3/qIMkTLFdtwm8HNMkESmMYELfdTMUCrTewkhorshB/5RAVcHRq4SwdOiu3BPo
 lXKaRSJmwq6BcU6iUavW+f2u7KPzXVqQYTEjJo8QVt0uEvrlQAZKJks
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: 1gxma9mlcGnHfuDJrEGFZrGJWZ7vn2wK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX9dfkQa/8TXHo
 eEAg3AavzX2h57lzn6TMSJXfFkX0tI0PEJTSDP87RxgDdwAxPmhM4bLR0KE+m0AH8spD8qBdbv5
 ocZCQCfioDxiySlRL7mvUhuLWIhi4U11VUeGUV/9JyxUIXBVVC9R+Go9X4wAOxr/Vc3tDY2JK4g
 U+CAVCmpgPahnUzHfDTl5GOX8ZpMrltAmvwpDzH6oYUA4roBMN4rlq0CHRk/7sZE52IWY8f1YA3
 Dd+yqc4ATOMVSM8Y481qBi7KEKO7Gg7oqrLOqN5Gs+9oaRiWUT06CsQLhhzpDMW6v5mH4AJgdqC
 9BTcvEpkD7YSDMH4XIPts9v46n97t9xPI7X4oB8p4LV4qG2uzx719297BPNuPinfehBV1BTztb8
 JSPThFBCLXjfC6TsoNaF91HPUeQ5/OGNUZqblgokzkCYlPHuA44bZdlZdBA+AWLwm43HGoAM
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687f3c43 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=vvfQ0qTNUOrexlX-OJMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 1gxma9mlcGnHfuDJrEGFZrGJWZ7vn2wK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220059
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

Introduce device tree binding documentation for the Qualcomm QMP DP PHY
on QCS615 SoCs. This PHY supports DisplayPort functionality and is
designed to operate independently from the USB3 PHY.

Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
standalone and does not support USB/DP multiplexing. The binding
describes the required clocks, resets, TCSR configuration, and clock/PHY
cells for proper integration.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-dp-phy.yaml       | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..17e37c1df7b61dc2f7aa35ee106fd94ee2829c5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP PHY controller (DP, QCS615)
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description:
+  The QMP DP PHY controller supports DisplayPort physical layer functionality
+  on Qualcomm QCS615 SoCs. This PHY is independent from USB3 PHY and does not
+  support combo mode.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcs615-qmp-dp-phy
+
+  reg:
+    maxItems: 4
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: cfg_ahb
+      - const: ref
+
+  clock-output-names:
+    maxItems: 2
+    description:
+      Names of the clocks provided by the PHY.
+
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: offset of the DP PHY moode register
+    description:
+      DP PHY moode register present in the TCSR
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: phy
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
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-output-names
+  - qcom,tcsr-reg
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - "#clock-cells"
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    phy@88e9000 {
+      compatible = "qcom,qcs615-qmp-dp-phy";
+      reg = <0x088e9000 0x200>,
+            <0x088e9400 0x10c>,
+            <0x088e9800 0x10c>,
+            <0x088e9c00 0x200>;
+
+      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
+               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
+      clock-names = "cfg_ahb", "ref";
+      clock-output-names = "dp_phy_link_clk", "dp_phy_vco_div_clk";
+
+      qcom,tcsr-reg = <&tcsr 0xb24c>;
+
+      resets = <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
+      reset-names = "phy";
+
+      vdda-phy-supply = <&vreg_l11a>;
+      vdda-pll-supply = <&vreg_l5a>;
+
+      #clock-cells = <1>;
+      #phy-cells = <1>;
+    };

-- 
2.34.1

