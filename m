Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32664C4003D
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 14:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A4310EAB5;
	Fri,  7 Nov 2025 13:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KuLzNU32";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EaGsyq4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B1110EAB6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 13:03:17 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7D3F6H2281961
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 13:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G40SlKpdS7e4bW3M9vZNvOUg9wFUDrREVO2yeCjm1Ic=; b=KuLzNU32VFXX3PL/
 Ly7KFKRWsRRyLpP96a5isxEzitSNgTn5+T30TrrEwtIQib4Eeh4UGzXneti/Cv58
 ldMRMgT3Sw6BUmajVsmqgCth+M1q/sAYuqLh/soLPAK65vwH7G53GgLL/Z6YTZC3
 9iB/f777v+mjf51rXsrb2lSaJ3qNF3irGl96B/XwySGlbOpQxADN6jmo6W6FyoTG
 FfHIhyb66k5D3+IxyxFXn3yayLydpdWRlhJSl1X+8XU6rpgnydLF8M2uJonRjI9I
 ajux0KUL1zv03p9C+Q3M6nd45WJY5JV2yrDvKDK1lYSNLUZ2N/hW/gOb5j35JCGO
 tWtFFg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9a9shaf6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 13:03:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-272b7bdf41fso13838645ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 05:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762520595; x=1763125395;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G40SlKpdS7e4bW3M9vZNvOUg9wFUDrREVO2yeCjm1Ic=;
 b=EaGsyq4M1WeSjC1D1RcbXiAewBdpn04YnQFYrLCkxLch3p6GjknrTveaBQ2C2iDMTl
 h5A3/p80ivehUgdLS7bL7Z6H1x5oGS9qCDdbjGGP56Y4RNeoI8QpXCIAvrP6rjAuIx2R
 XJGvQxbCPfuKkJYkzGdALo33z0KTxhoImi63nnhGYaZjGVZQtx1zoaAN+SHtsiXlH7WB
 9/whNSUXfn6HaN0YH5JsQFmp51I4t67sXuKIz4rXTpa0ci6Ha6L1CmMOFz0/xWCbAFJw
 lmR9XbtZGVaBcDei7jDrs1UQ0eeFmQPAddP2rpSkDZmBagIZmxFpWC1196+5ZR73jpd8
 WBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762520595; x=1763125395;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=G40SlKpdS7e4bW3M9vZNvOUg9wFUDrREVO2yeCjm1Ic=;
 b=gu9miHo0wy/e5mbUxlJIWp1sS1slR5smQ2Krd6tAY6q7CK9ijFZb/HJJ7++fwSHphT
 8yjridtP3JEM83AFrxN5UwTumyESLdmCExIyDprc0hkFJD0SNRUlS/3XkCqbmxvO3V6r
 euaj35IbOnJv1gKDvEacwLGu5MTRHfghnu9ZtLJNh6keS82Z86K06Koy1VcrrAIV+0R5
 Y1E3hUd7gW61HrYK9t2r91guoScl/AmRhDrsKJ98lygn45coDV5mqYpa8mLZ1y9/y0Ne
 kiWFzz8USHKjJPs3av+/YZfOYg9w3oZ6LuS2sHDRihVEuBLw4zFZ0Zu7RVju+mkre+WY
 V2kQ==
X-Gm-Message-State: AOJu0Yy6nnpjW8EuWgy49u/VlwfYzZcBCKYc/xI6cTcskgzesgL9/j/V
 FsfgOnF403Ma/jb7Clh7CPnzS5sOzGEpWwABOlsP+rUdNCd7yIQAkt0YXnfnmH3K5RXrX+8Xvv2
 PvwLECFwSyZ/WAvzDiuhbUVOFtf3c1jhOtQzjUenfh0D9KimpnNERy9pmZz9CqOhD3vsX8A==
X-Gm-Gg: ASbGncsV0+91p+/FJGqvuiBPfCSXPTAQBlluWt8Vwjm1w6pBGFMvRm6F/6Eh5tYEhoO
 uo5VFHtODFtT38veVojmjJBQquJmnKdDd4t/k/jXeWfR0LTAkQUr0kJ3b2RCuMEVOGHNK/C20Id
 TQjOFMmF/8eFmovd4p6io/BTvF7ZrF6kyzURGjk887it/heE8NGbawob+KXKly05b7d0vsLIe54
 PDiYZdBnuDuiJGhf+mKFODBbheZSyIfdydPichemRlteWZ7T2lxaz9abQazz0qnS8Nbapw1rqs8
 YuGAzu2/wEiE8jpBmf7d0N0T25Kdcd8UYx9DNsNkk63VACEQh4et2pZCWC2KMPvRChe6lsJrce+
 yWYkPlHVBdAEay6IZm0BPd3PQ
X-Received: by 2002:a17:903:384f:b0:28d:18d3:46cb with SMTP id
 d9443c01a7336-297c03d8fcbmr44202215ad.20.1762520595187; 
 Fri, 07 Nov 2025 05:03:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1NShUF3UtYHtrjbPiVmio0Nnbx07gYYOUbClFgiyLSaZbhV+891/JDNA6u3MCcjSBxwtjDw==
X-Received: by 2002:a17:903:384f:b0:28d:18d3:46cb with SMTP id
 d9443c01a7336-297c03d8fcbmr44201605ad.20.1762520594431; 
 Fri, 07 Nov 2025 05:03:14 -0800 (PST)
Received: from hu-nlaad-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-296509680e5sm62477745ad.1.2025.11.07.05.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 05:03:13 -0800 (PST)
From: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 18:32:58 +0530
Subject: [PATCH v2 1/2] dt-bindings: bridge: lt9211c: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-add-lt9211c-bridge-v2-1-b0616e23407c@oss.qualcomm.com>
References: <20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com>
In-Reply-To: <20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Yi Zhang <zhanyi@qti.qualcomm.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762520582; l=3387;
 i=nilesh.laad@oss.qualcomm.com; s=20250718; h=from:subject:message-id;
 bh=Cc83NWmW1/dAnYephO+V19Kl2afDLNqD9vMBq15QmpU=;
 b=xZrZ3hN+em7gs+lxlTPFVBXdsZC4IcKxjtImY2IMxTEIRL62qrDH8Z8INVgQpZxriJ4DSXywX
 oh1E1F9PH+QCQzv7eUv6jv5t3h/E8gq1HgY99ZjjtuxrMy2iSMe0I8h
X-Developer-Key: i=nilesh.laad@oss.qualcomm.com; a=ed25519;
 pk=MjLHvGipC16awutyYh0FnLpT1nPxL/Cs1dCevHMrrD4=
X-Authority-Analysis: v=2.4 cv=CdgFJbrl c=1 sm=1 tr=0 ts=690dee14 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=Xc6W96i5Xe6cDM1WBtQA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEwNiBTYWx0ZWRfX0M4E5QFFecHj
 U9GmFQ7PHsWwwSs9KpyZ3b40ZX2UMRAa7Nvsb+zKS/h7uYSkFSz5nieR/amSyNrE5Kk0PTa+LEd
 WWr1VRLEgvcx1d+c06p0wSsw6RvzUl/lXJIOpjp1fzT587oiZptd4EVfIQBgAycDG8lms3gSeny
 0Y66ly8zT+twtd+EMH5UfwNip0BHQ7FEZp7Omm+5nXycrEnIHY6rVZ6hV9ry5yENr+8G5ssoo4r
 dV5qkY1F5D/5uVtYfHbiCoRkw5SVHoIKCo+MOTeDUNSs2uO+E+uezeo0EUA14lJO8Ey9i0haAmp
 gKX4q+HgpR/Ps4jnzInAI4TBTv1Zxo+K2tw96gQx0OTCamEwInH4r/XpegTOjGuecUxLiOErn0E
 5ukKfK1PRqxIrtfvmm64alauCz8Mtw==
X-Proofpoint-ORIG-GUID: NO0jOAR7B28JUZdmJQIos6J9E7aV3rHa
X-Proofpoint-GUID: NO0jOAR7B28JUZdmJQIos6J9E7aV3rHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070106
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

From: Yi Zhang <zhanyi@qti.qualcomm.com>

Add bindings for lt9211c.

Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
---
 .../bindings/display/bridge/lontium,lt9211c.yaml   | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9211c.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211c.yaml
new file mode 100644
index 000000000000..619f718618d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9211c.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lontium,lt9211c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lontium LT9211C DSI/LVDS/DPI to DSI/LVDS/DPI bridge.
+
+maintainers:
+  - Marek Vasut <marex@denx.de>
+
+description: |
+  The LT9211C are bridge devices which convert Single/Dual-Link DSI/LVDS
+  or Single DPI to Single/Dual-Link DSI/LVDS or Single DPI.
+
+properties:
+  compatible:
+    enum:
+      - lontium,lt9211c
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active high RESET pin.
+
+  vccio-supply:
+    description: Regulator for 1.8V IO power.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Primary MIPI DSI port-1 for MIPI input or
+          LVDS port-1 for LVDS input or DPI input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Additional MIPI port-2 for MIPI input or LVDS port-2
+          for LVDS input. Used in combination with primary
+          port-1 to drive higher resolution displays
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Primary MIPI DSI port-1 for MIPI output or
+          LVDS port-1 for LVDS output or DPI output.
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Additional MIPI port-2 for MIPI output or LVDS port-2
+          for LVDS output. Used in combination with primary
+          port-1 to drive higher resolution displays.
+
+    required:
+      - port@0
+      - port@2
+
+required:
+  - compatible
+  - reg
+  - vccio-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      lvds-bridge@3b {
+        compatible = "lontium,lt9211c";
+        reg = <0x3b>;
+
+        reset-gpios = <&tlmm 128 GPIO_ACTIVE_HIGH>;
+
+        vccio-supply = <&lt9211c_1v8>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@2 {
+            reg = <2>;
+
+            endpoint {
+              remote-endpoint = <&panel_in_lvds>;
+            };
+          };
+        };
+      };
+    };
+
+...

-- 
2.50.1

