Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A424826B38
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6769410E1C9;
	Mon,  8 Jan 2024 09:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BAD10E1DA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:59:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4086Tspa004308; Mon, 8 Jan 2024 09:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references; s=
 qcppdkim1; bh=0A4dWjeTe964GhDfrDlin8+L7fz961yrQfFOr4Gh+o4=; b=HX
 0Aw6iXyUlGeyVisLFH46Aeynbzmf/AILyIPbIkU2pjEkUDXWXCLx5/vbwWQTghXf
 hVg/28Tuwg8ip2B2XW35R807klFB5jNocRifzvzT82ZYW5APXccIfzUqiXg3z+Ld
 9PVSE+tXoRje2TS5Iz6e/bHPCXfHmxXxX8JFI/TF1OTEAUVbAFbsfeH1E56aeVYD
 LjoXkNj9+S687IT55fSN6SWYr3piQMOVPVwiUIhLt8rkX0/mXuBRP1X4gsWcYovq
 osdx6Zfwhhjyc5/NlnrruoB25X9Uq2GmGALjtmVPLhUEeEEkrKjfE0Qlz+ce1swV
 gciT/RX4pwCfxEVYrzbw==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgbu2gcad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jan 2024 09:59:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4089xDAm022554; 
 Mon, 8 Jan 2024 09:59:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3veyxkkdk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 08 Jan 2024 09:59:13 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4089xChB022539;
 Mon, 8 Jan 2024 09:59:12 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-riteshk-hyd.qualcomm.com
 [10.147.241.247])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4089xCjS022534;
 Mon, 08 Jan 2024 09:59:12 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2314801)
 id 398EA5013A8; Mon,  8 Jan 2024 15:29:11 +0530 (+0530)
From: Ritesh Kumar <quic_riteshk@quicinc.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [v2 1/2] dt-bindings: display: panel: Add Novatek NT36672E LCD DSI
Date: Mon,  8 Jan 2024 15:29:01 +0530
Message-Id: <20240108095902.22725-2-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240108095902.22725-1-quic_riteshk@quicinc.com>
References: <20240108095902.22725-1-quic_riteshk@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: p8_jVZJPHqjPRky-0SFjoWPFTJQavOrk
X-Proofpoint-ORIG-GUID: p8_jVZJPHqjPRky-0SFjoWPFTJQavOrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401080084
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, quic_vproddut@quicinc.com,
 quic_abhinavk@quicinc.com, mripard@kernel.org,
 Ritesh Kumar <quic_riteshk@quicinc.com>, robh+dt@kernel.org,
 tzimmermann@suse.de, quic_rajeevny@quicinc.com, quic_jesszhan@quicinc.com,
 sam@ravnborg.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document Novatek NT36672E FHD+ LCD DSI panel.

Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>

---
v2: Fixed review comments from Krzysztof
      - renamed to novatek,nt36672e, since the binding is for the IC and
        not the panel.
      - moved additionalProperties after required.
---
 .../display/panel/novatek,nt36672e.yaml       | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
new file mode 100644
index 000000000000..dc4672f3d01d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672e.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36672e.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36672E LCD DSI Panel
+
+maintainers:
+  - Ritesh Kumar <quic_riteshk@quicinc.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: novatek,nt36672e
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vddi-supply: true
+  avdd-supply: true
+  avee-supply: true
+  port: true
+  reset-gpios: true
+  backlight: true
+
+required:
+  - compatible
+  - reg
+  - vddi-supply
+  - avdd-supply
+  - avee-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "novatek,nt36672e";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 44 GPIO_ACTIVE_HIGH>;
+
+            vddi-supply = <&vreg_l8c_1p8>;
+            avdd-supply = <&disp_avdd>;
+            avee-supply = <&disp_avee>;
+
+            backlight = <&pwm_backlight>;
+
+            port {
+                panel0_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.17.1

