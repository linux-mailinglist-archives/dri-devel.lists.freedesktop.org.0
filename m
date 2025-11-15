Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7A2C5FCC5
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 02:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4853B10EB85;
	Sat, 15 Nov 2025 01:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7ADIJWR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJ3qXlYO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E7510EB85
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 01:05:33 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEKs1Dx295908
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 01:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RR+tVpoDEaebf+Sy0qNjETQNJqwIHKqC7G3+JqnRRqw=; b=c7ADIJWRG+EspW8Q
 QyWkEv9sLOGjw9844R2qG3eVStgfRon92EMDcenOSWz9xdLAl3vpToGtwk+Wh4Tl
 fjq2bF0YG29V5+7CL/3xNaqQ7kHR7QeCypVz20dH+5K6CKkYLWSrrToK4F5ddxZA
 OR4N6/qmseFyI6KkRu1Xvt7aqkOeKuQzH+EzD8XwMcqAIhFEi051X9Iy6VbSUcaY
 GW5UccUaXZx9TqIVAKlj1a4I5yAwtyRBlTrJ5jxBbzdgObhoe6PVnoQarV1fPv0N
 oopHaxAA7b0PyM3odKNsF45UrO2Dg7fkGH/v4RCsvLIFBcznBv7FJBZ73+fUCWxK
 RX8JCA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aebuyrhjt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 01:05:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7b848c640a4so637764b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 17:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763168732; x=1763773532;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RR+tVpoDEaebf+Sy0qNjETQNJqwIHKqC7G3+JqnRRqw=;
 b=CJ3qXlYOnL7w1448LX0a29usR+ZTS55jd8HjPJSWEPS1zjWS/ATnt5Nz9BzC3N93JO
 XmIYLZDbUOygXfFwQJiaxuoWX2VhoqwveACaPCg0U7+2kDVWO5cyJmCZc6mL8vlmW51T
 74ClxmEeM/svA86PB4WM2EYPomiI05dwKeIZ1oiUouYB4QV1Zd7SI2WPQFLLkHexCzZL
 /7UrV+1RLouvhuMkK9UrcW2q+PRfkcYMr6NTWtBmIQoUpc4Je7aXU86MRj7GIWmy6TLb
 KtnOhpw+bEWKmPw4aAYTYwfpiYDU/8Gi+5zU7OAQf1TghywCSvvqHy+SGROrBtM3Oa51
 ob/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763168732; x=1763773532;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RR+tVpoDEaebf+Sy0qNjETQNJqwIHKqC7G3+JqnRRqw=;
 b=YFArWI5iJ22+qrlsoA+GyHbV0nq9Ny03TRZjeqm7Oeq7WSZjYfQLYv/2SlZGyFe14w
 /KZpwT1Vl4kqYe1NALHO1zAyFW2Xt60wMm/xdURGDJd35KtGfY4Qki4VzJsX6DXBGve8
 PxJW0MDGQ6OtsGHT641NtvH/B2Z6XOZkw5+molibRVpEM5A0zrZpc1vRjm336FdkCVv+
 AU48smnIXl8BbkCY1Qq+qU9J3WrE+7jHCIkYx9sZ2+boaZHkI1cw0BXiMag51MiYGkqz
 nqoSYeBZDvYH46ZQPQXF9RR+LNXFZdv/y9vqWyrM1vPoCdJ79JLr+B+nzXpZ2tWTDubs
 v7iQ==
X-Gm-Message-State: AOJu0Yyu5WWwwfZ7uRRQDYpxZEeOoEExlcf+wtYNyfXI+h1OrzVb2KlD
 tkQNuUDfniX0ErOpPUCjEv5yAnjBzjaFutS1UZnzitCBnsliEfU/7Wycj+KpwZo1cxRuR9O2wxC
 ot8vVTJR6ao8RnVnB6iZ6e3l08zvikxQAm17m7IbqVtK6jvg2KhVtPRq2TnbdCAKcFDZffK4=
X-Gm-Gg: ASbGncuNQB8yQ9G9R08vH3p9qBxZtUQ2AWeIv2E1++3urs/jQo7hPpRwlMFE8iCSVhy
 6IEUQ8lygYGkB3WJ7ZPN1n6Gt1BQWCgT3944r/kiTkhoiw/ythhDe0zIx3oiPahTm8MHuaofqEU
 1z6jguZYeMqWE7qXfHHXypBPe9it2VD0fQTcscj5NesOWlxZmfQQLlYOQznqcXQEcKXoJ7JQtIA
 jhuJhH1MIMWPXmexjQzLs6eEhEe2RCcHJw8qV44FCTNTqrWOcZ6iBvANYThTyjbmgFgao+6mIGa
 2InIoA0+muhgWuWgqg/CuBPAB8MgCqYdLulXGVxZsmroPnea4vmvk+uriudDXKioImAaYYSYtMp
 8U6Eug1AlBGIsySBGPsHIsiHCfdjWKr2GxHw8PZlFZqnGHFzj1+hZaMDpuZie/8Sc4gnL2uj3QR
 daDOEk1VNWu21pneKGUc4=
X-Received: by 2002:a05:6a20:7486:b0:354:23f7:18c with SMTP id
 adf61e73a8af0-35ba2598c21mr3387767637.7.1763168731824; 
 Fri, 14 Nov 2025 17:05:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxKHHWyeF/B12GRIGZkL/ZyBnV3S6boCfQwEZ44kCegDhI+ybTu2G+MczlCk79E7vfTpIm2w==
X-Received: by 2002:a05:6a20:7486:b0:354:23f7:18c with SMTP id
 adf61e73a8af0-35ba2598c21mr3387743637.7.1763168731333; 
 Fri, 14 Nov 2025 17:05:31 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36f42eb0esm5812976a12.13.2025.11.14.17.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 17:05:30 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sat, 15 Nov 2025 06:33:56 +0530
Subject: [PATCH 1/2] dt-bindings: bridge: lt8713sx: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-lt8713sx-bridge-driver-v1-1-bd5a1c1c730a@oss.qualcomm.com>
References: <20251115-lt8713sx-bridge-driver-v1-0-bd5a1c1c730a@oss.qualcomm.com>
In-Reply-To: <20251115-lt8713sx-bridge-driver-v1-0-bd5a1c1c730a@oss.qualcomm.com>
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
 prahlad.valluru@oss.qualcomm.com, qc-display-maintainer@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763168720; l=1935;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=cwdGCxsVbYtDSinu5ZpBST52JwFFFj0brnpQS1egAzk=;
 b=WI2/JRYaB+B5FGQENnK0+GCA7HF8W5za6woABC0rJzlJGgIMzi8nY7ctp6Z76FNXiOzW4vQg5
 wyuzJG9Je1eDIIL6bprekjLw0+ytrjPUHmwRPH//5MRm9Kon+h4G7bJ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=MKltWcZl c=1 sm=1 tr=0 ts=6917d1dc cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8
 a=s-pyTce3ZDEYjec7AqwA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAwNiBTYWx0ZWRfXygMRZiEaZeDG
 lI8XQp6H+A9MMmB59hp//DeqJ89Svtg/gSg9dqdIv/yKhtAXOwcHHKBzbvcMIWeuvUCnP/qYscU
 jYSBlnaIbPCwcz5PHYK1E/fdJ1A235p0P8OP+ur+6AG5Dmjkx3Wh8JfJNFRmF5pK6Ocx1H/wznu
 S/VrQuAh6eod38Chobiu6frVjbs0IXz3EfVYzehlYVTJz95FyY3lyLhKmkDuAZ0sCBV+f0JK388
 1rgOio6nVZzqtcrtT+40U58WS29qCqYfLoD0rKfWCaXfsAfE7np2Rs9hyuscXoi4sw+6DPbJynv
 MOxDVJ6NZTvparV/yFeo8IorViujnVtZ2gN/DGl3Yr/7MpygN/t234ubNpvpq87NKYxau6Ul9p8
 NYiYLJQq4rA6cTUAKiffqxXmlUP6hQ==
X-Proofpoint-ORIG-GUID: OEoKVOScUxAfGsKreuSn2RQRhuOqpZow
X-Proofpoint-GUID: OEoKVOScUxAfGsKreuSn2RQRhuOqpZow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1011
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150006
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

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
---
 Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
new file mode 100644
index 000000000000..3292e149706c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8713sx.yaml
@@ -0,0 +1,47 @@
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
+description: |
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
+    description: I2C address of the device.
+
+  reset-gpios:
+    description: GPIO connected to active high RESET pin.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        bridge@4f {
+            compatible = "lontium,lt8713sx";
+            reg = <0x4f>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+        };
+    };

-- 
2.34.1

