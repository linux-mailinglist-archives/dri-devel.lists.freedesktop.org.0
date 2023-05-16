Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569017058A4
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 22:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA2510E36C;
	Tue, 16 May 2023 20:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8146810E369
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 20:20:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34G7hqZR030010; Tue, 16 May 2023 20:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=RcMpFL/1BNzqBrHGF4+zHAgYdlzwLWrfo9V5uZzJJkM=;
 b=Xqb8b26tktbR90uo0QZqnF0tQYzr4uJgTdKnJNwnT3Di9UZbGqsPuuMu5wPU3G+mbbey
 sGmifus2ZTTq92jDCjx2+2elk0XINcXCTDJZ9G43HQ6aetG1Y5nfFul6xhCOgEp18tOl
 uaq37+wvKuFEH3GTAEFu89vWYNPX9h0xyX4dfAHlctdZbB0FNTbeETeQALDh0YQevShc
 976kDGL5OtkbmP5vMdufQuC0DsYn0Ev/S8i3vrZZKksC62/sWsnNJWADakAF7IQ926ts
 dcqsmSLZ9RQdXWs1JzIoMQIZVnyQWnmtPf/nyLC2XN/o1vhpGFIHuC7P9PYBJpxy7YSU DA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkwmj2eq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 20:20:42 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34GKKftm000451
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 20:20:41 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 16 May 2023 13:20:41 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 16 May 2023 13:20:30 -0700
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Visionox R66451
 AMOLED DSI panel bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230516-b4-r66451-panel-driver-v1-1-4210bcbb1649@quicinc.com>
References: <20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com>
In-Reply-To: <20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684268440; l=1860;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=6Bt19SqVx15KKQdEwoUJMsEq/JlcrwdMsaR3//IInu0=;
 b=XbiZ15f+MYSuvXYJjMD7htC7HM23rtBfELuMfshE/EYwxMjX0Pw5uCgNoiYHc8ED2MhzUAj9v
 nUBzR+q9nAnBwSBoA4HaRv17k2ZjA+wBtFWXbhBxEh8CPs0ssmt1ZBv
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LThx6duuzUOSSktUX2eoZbE5iXeFew6q
X-Proofpoint-ORIG-GUID: LThx6duuzUOSSktUX2eoZbE5iXeFew6q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_12,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305160171
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
Cc: devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the 1080x2340 Visionox R66451 AMOLED DSI panel bindings

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 .../bindings/display/panel/visionox,r66451.yaml    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
new file mode 100644
index 000000000000..6ba323683921
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,r66451.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox R66451 AMOLED DSI Panel
+
+maintainers:
+  - Jessica Zhang <quic_jesszhan@quicinc.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: visionox,r66451
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vddio-supply: true
+  vdd-supply: true
+  port: true
+  reset-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vdd-supply
+  - reset-gpios
+  - port
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "visionox,r66451";
+            reg = <0>;
+            vddio-supply = <&vreg_l12c_1p8>;
+            vdd-supply = <&vreg_l13c_3p0>;
+
+            reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
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
2.40.1

