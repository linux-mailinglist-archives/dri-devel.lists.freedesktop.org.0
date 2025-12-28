Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32628CE4B4B
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 12:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531B810EC3F;
	Sun, 28 Dec 2025 11:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3MW3z40";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOb2WnLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3A910EC3F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 11:41:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS9FwLj3974287
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 11:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FNT26ndq1t4/QCNe8yPe6Cu+o316T1+uFmgBr5OVFOM=; b=D3MW3z40+TqJTav1
 19BrlbI3hdzcXV4QtIE8X7n2pp5v8RisK2k14OlGoKiDMd13JV+jdXyMVZAuGLvi
 kXu6CqlAsMWKBW7AVbZGTHKeBeib0DNBGucKITj+3av6Hat3WhamwJh6lU0Xl3Km
 bpV6BGIlX75PfliOOu83gLNe4QabThLU4AP/OfGAwyaiVVbIxoKKvBw1xjUWzKDC
 EdLwpuqCUN4XUOaW7HTiUJemS4fTDz7rq94+zkJW5sGkHcVIIJlj17yeeIASOaQv
 q7e8xHtnJdyVgyXFB8BngyDRsAkdGjkXGcMNN6QFx3YB0gAKyQRMSbFyGA6NgiYI
 G6W4qg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj0gf4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 11:41:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a33a163c97so28054285ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 03:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766922088; x=1767526888;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FNT26ndq1t4/QCNe8yPe6Cu+o316T1+uFmgBr5OVFOM=;
 b=bOb2WnLoeQNR405IYFh8lfHR60ouQn7RmOVvPR6NNVQTszR7M4mucJk9bT0FbNnow+
 3SquBdJeUgoD317uCM9sA4rM0gxa+mwVaeIBi2Nzx64XaWds7s8zDktRBmdFHjOFF6Pr
 SLLw7fOLsLXaX/X+1i9kEzawUzcCKB8USNQiUdvWlzEBXhlX3cHvDsIVz4fYlp8h379Z
 NV3nTJlTdxN3bRWSFnPlCDdEcRqxrFITFGUX09sis9ku9fvfquB9WjW0LuUrZ5yYNJ8u
 XPkfjAZ/JDJjET6XxjUqx7QYLEwrwAIqPxWHRqcwLQRTsxYJ+ODFsq6NmZUaB8dTUznQ
 maxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766922088; x=1767526888;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FNT26ndq1t4/QCNe8yPe6Cu+o316T1+uFmgBr5OVFOM=;
 b=Us5GEwdMyag2Cr8UX7kyTLhVryXzEx/NFrpjM5EkDaVL8AMAl4NUMyKyz2e3zOIa3p
 egwORe6SnPPTvkHHZ6fLC4tbIpQB6e9lDUWqemtx1OaG2yyVHoGAlDLzfT4z4xKXlpA6
 uTfw1DLQz+lPaecYm+Ss89/q0tHzz8sHTqtVaDWDUAANiePULj8cbeMMwzic6htD5+Up
 hggfErYRFgYNX1xHh0NTohcHvhdZFw/cNs1ZooG3OcEhvnbgr/gOTesSptjAUX36kbCE
 DjZWvu/XTyYSzToGSMTxbHOlpaVGwq74UUY6S/hX+yph0ICMsjd6uMOEKqDG2avjNj78
 0/MA==
X-Gm-Message-State: AOJu0YypBiIIMkxBmvyFpBUhJ252cnkMTJh78sUus6+tBlnGRclJDWsR
 Q6OZBLhcaR1G6udaYEeIJ7tZXUZuYhMpIBOfkEi8Uy+DP40DOMiwgwORiDDhmLPYqHxDw0/KknR
 Hk+zTgYR0HkajK+/b3eSsZxXFFNVeNigCen3cu8EXtyuI9FBWZ9Wso8iFzftR98+RHBqQ1s8=
X-Gm-Gg: AY/fxX6IQNYEUGLFK7S4mZBAc/V7PeSWGSrLXloSgkJlvkel8Vz7RB1OwvuJnsBP+/Z
 li1LgT1IdbYq0vZIwfjudc7+PDWviBNS02qhV10rplAwaGBHq/giEL1Jrk6fcLiWcuSpAjy82DD
 TYd8eyA1KaLC+5RadYt0DW12D6KEGYLRlcZlP7gImSIlcMwzCU1MRgCXdC5et0bzLNWtRLHLudi
 oxnHeND1sDZ9AByWUhThn/fmWjNH6zpSmSH15/S9vcbRfeBJTuUeyce8V+BjNpqrok9K04+sT7L
 31TrEBV7bdabcOwgYfN0bUTvzHJPlOKjkR4IQ4Tx+gS9yzkLZ2jHJGZySj+l2DjtFX+ZZAQcszk
 Wa6QgALHCqSOVFRI3wpFRpHpLtPevY9ffB85gah/lPHHPhps9JvOqehJmSObYNnGyv4n4EtzEIA
 FvJfRQrWh+90fseOI79bQwFo5bkMpEBA==
X-Received: by 2002:a05:6a00:2d1d:b0:7ab:9850:25fb with SMTP id
 d2e1a72fcca58-7ff648e4c38mr19484080b3a.2.1766922088235; 
 Sun, 28 Dec 2025 03:41:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5lXiGHvxQ4uJ4M5pEORms1C0F45w/GKGFFYagT0cJBDkpxnUqrLm7f71ENER/q9umScaIqw==
X-Received: by 2002:a05:6a00:2d1d:b0:7ab:9850:25fb with SMTP id
 d2e1a72fcca58-7ff648e4c38mr19484071b3a.2.1766922087808; 
 Sun, 28 Dec 2025 03:41:27 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e197f9asm26214067b3a.43.2025.12.28.03.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 03:41:27 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 17:10:39 +0530
Subject: [PATCH v3 1/2] dt-bindings: bridge: lt8713sx: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-lt8713sx-bridge-driver-v3-1-9169fbef0e5b@oss.qualcomm.com>
References: <20251228-lt8713sx-bridge-driver-v3-0-9169fbef0e5b@oss.qualcomm.com>
In-Reply-To: <20251228-lt8713sx-bridge-driver-v3-0-9169fbef0e5b@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
 prahlad.valluru@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766922077; l=3328;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=XVPQ7rPYmAEJm3mRiqhhzmp1bAkwnsvuW/w6LudOoJk=;
 b=LraHjzxylvSG8j/1IBKt7BGO3vHl6tIWqljjLLjyhBaPzV5EKiOklZZon714wAlfVmsYNorcz
 ShxYcXM+IsnAhriKmMZWOx+qvNnXwWnk/ITJVs655y22Jr9FurnNuEu
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: GCOS_pQJFoanCkhtxDAd0Zp_mk2yK_iy
X-Proofpoint-GUID: GCOS_pQJFoanCkhtxDAd0Zp_mk2yK_iy
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=69511768 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8
 a=u03R5FaqcccxyDpVlScA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDEwOCBTYWx0ZWRfX9F1zxNI3G29f
 oh62UK9URQVXwqIsBb+J1k2aYqHmzSBfFGehjO1Xg3X1eIQW9YeQkrAAwMj3XBN8Rr7K8Sl6Pcn
 jFeHiAIfVG2Z/eFU2zDBxkf6EymmXjC8XUvV5r4+YeXAnLpvtYUZh1tp4z5k9p+c1QS6CZ9M+T1
 zL4Uf3wQuFvXcth0PowwCfkMgYzHhj72q0ntnUDX+7NoBTi7hSDnxJd9sg9Xkbuplg1pXIzRaZB
 Av5MD0Qfl75sAjKt6UY0X2veOxvkXeGNXCkVN2bSE1IjFy/Vc+gOAfdZADqpyff6fufHiaVtOPK
 U2YQ1jKTfaly+LC2JO46RN7tTVOeX2LWvSn1/pN5QhxEmYX8AnnM2BVWsf62Eu3xnsLTXduNscu
 dR/CfC5tLBO107P/ny/kLoufvMJ576gQjQZvEUJuR6NVUQtD3oBJrLGzKi3Trx9tn++8wCEMplX
 Q0vZrsWhbhD/gMfU1Zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_04,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280108
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

Add bindings for lt8713sx.

Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 .../bindings/display/bridge/lontium,lt8713sx.yaml  | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
new file mode 100644
index 000000000000..0a6dc56e337c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt8713sx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT8713SX Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0/DP++ bridge-hub
+
+maintainers:
+  - Tony <syyang@lontium.com>
+
+description:
+  The Lontium LT8713SX is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter
+  that integrates one DP input and up to three configurable output interfaces
+  (DP1.4 / HDMI2.0 / DP++), with SST/MST functionality and audio support.
+
+properties:
+  compatible:
+    enum:
+      - lontium,lt8713sx
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Regulator for 3.3V vcc.
+
+  vdd-supply:
+    description: Regulator for 1.1V vdd.
+
+  reset-gpios:
+    description: GPIO connected to active low RESET pin.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          DP port for DP input from soc to bridge chip
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          DP port for DP output from bridge
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Additional DP port for DP output from bridge
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        bridge@4f {
+            compatible = "lontium,lt8713sx";
+            reg = <0x4f>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    lt8713sx_dp_in: endpoint {
+                        remote-endpoint = <&mdss_dp0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    lt8713sx_dp0_out: endpoint {
+                        remote-endpoint = <&dp0_connector_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    lt8713sx_dp1_out: endpoint {
+                        remote-endpoint = <&dp1_connector_in>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

