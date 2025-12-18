Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7A1CCA71C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 07:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E49E10E51D;
	Thu, 18 Dec 2025 06:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0ie+oIn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wclu1S3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39CE10E51D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:24:34 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BI1ZjkH2016404
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6uvKGEnhe6pjfLoE2vbLJnqxhEW8HHQ6u7PTnpBiilk=; b=K0ie+oInyr/8ullV
 pr9z0IVsiGSzm5JpEayA6eJnTmbsWQaQtAx1mpd0zP5nOgV75lR74rOj5P4TWe3v
 AyIvRrtktL+2fwOv/NjENHhHU7ugKYFGkKrvjMRe7WVbqECiJnJZi2QjMZSV+0hX
 feRf9PfOKyybZcP1OjaFU7AuqSQs+9q8Jj4nnGos6SjTYBbzjYh8K3lM3CWuOBVd
 qYq95kvGC8vTHSekcQ+p1M7/SvvBanPYCSvEaw/k0iayZrx6vhf4s55ijPZVpyX7
 uRVg9xaXgazWGtYnRqSiFFGh2gx3nuKajKd6+OsDMSYa3rGnks3dWXaZyX/zGHiE
 iLJlPA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e3c33-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:24:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7b89c1ce9cfso478372b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 22:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766039074; x=1766643874;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6uvKGEnhe6pjfLoE2vbLJnqxhEW8HHQ6u7PTnpBiilk=;
 b=Wclu1S3Ejm2S0c36czenH3Ja/ZZYWvBmCIoFvPu5It085VF9diPc88ADu8st0Dx/oO
 AdoryoXocm7Nzqk9l1K7qIMul4OEDBCw6xNEK3az9vRmRVBuQt/bMP23m3DVM6F5FAZL
 Nai4Qvuo7RO3NkCc3WtQ0ZyFkCiqRyhB+TERc+OKDlcM67uD6/I921GjxRgdlrY26EIO
 K8493AjBLGtJ0kRmZGclBiCQwA+JUrGyY4fb1mDPSwP2k0oPDsV8mIkow+Ns3UnLWoVH
 ids8u+HgspVVB97oay9uLtLhjySrarbS6ZS9wJTIFEUR9SzbZeZ2KIZB/s0bbENs1fWo
 ToTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766039074; x=1766643874;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6uvKGEnhe6pjfLoE2vbLJnqxhEW8HHQ6u7PTnpBiilk=;
 b=tOHlrAqPiKPIDy6hbz18n2yRmgxQW+7QWhkhYnDsCo7DiwXRqa3bmFmHBD3049jQEx
 imKThWgUGRLhzibI1xkTgIascKubzJynk6jxo+dqY8xfHuhXeWGB/UdvgK0vl9YoUSgR
 CFQ9EK+ZYL6q/ahJw7ciDnhdYgvSooIOf57Cqr/nirwCP7VJdtp4yMfErhM9N5l3U79e
 J7BZ4sBOxiFmaZrzLXUA30KfcfIzIpSM0JHktrzTx1tyCu7lrrM/fbSeXumFgKU65g29
 v7v/lvNZ7poiC/4sD/XIsm7qZwVcabkdvK1A78HQx50o2I7cet2AiVgksoFsnWzPuMH+
 tpBw==
X-Gm-Message-State: AOJu0Yz1O2aHF9xqgxTt/n4zq/Vc9RPRfT9JelNPEmmAbOjobwiCiQJr
 NUiOp/qjjxCn9E5n/MfJo4430vEGmOJWVI/xJjXTB8bswT00+lbBUEb4y4udRtfbT2YvpB8fmtn
 F9ViyEQ6OlKsLXadSIp7C3M5g8BzaTGPGf9xFJ6j54CBzO+QWq6IitEV/4hIEk3xPsmq8uTs=
X-Gm-Gg: AY/fxX5At08J2a2iU+FRKOu8J3KK0TESST2R86pOjvL20ZWgbY1lk9I6qjA7P2WMxec
 jxaWNXGj7yc5VmgVWofeECt38QXYpUYa5csunS9Boc7mrxifwayouO6CE/MTdJ6OK0d8OBO7Rxa
 H3bobB54YOtaqQlEjOAZBiOsM5bD/D4trRWoynTDFepfbo7HdMW5RX2mauIGG9VZ8DZd+4qY9m1
 s9oJp6ZmPkI8/74do9hvptJfcbsHy4btpy8IWE6wDOnYJBLx3qVQzTkQPwOpaa4lTc0pmHACFdM
 nQQRHaoA3JPvTiPRCWlkdO1tPwZoXsO+HPvjtFOOITXH9dcmzCepAKCsV7J9JzGwglemJ0uhidu
 u9z/wDlTY9Wb2yQ4mkAGEHDStKW34NSO6K6aVl1ZUZDK7bl0ZNA==
X-Received: by 2002:a05:6a20:4306:b0:366:1e4c:e6dc with SMTP id
 adf61e73a8af0-369ad9d825amr18490218637.3.1766039073596; 
 Wed, 17 Dec 2025 22:24:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiyTPRMnsbhCkfiENIikkJGznn0RbyEhUjF2FXxdiraJgjxsN9O0XTm9l0bMUuqzjp/DDR5g==
X-Received: by 2002:a05:6a20:4306:b0:366:1e4c:e6dc with SMTP id
 adf61e73a8af0-369ad9d825amr18490176637.3.1766039072988; 
 Wed, 17 Dec 2025 22:24:32 -0800 (PST)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7fe0eb24d7dsm1433161b3a.0.2025.12.17.22.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 22:24:32 -0800 (PST)
From: Venkata Gopi Nagaraju Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 11:54:07 +0530
Subject: [PATCH v3 1/2] dt-bindings: bridge: lt9211c: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-add-lt9211c-bridge-v3-1-1ee0670a0db2@oss.qualcomm.com>
References: <20251218-add-lt9211c-bridge-v3-0-1ee0670a0db2@oss.qualcomm.com>
In-Reply-To: <20251218-add-lt9211c-bridge-v3-0-1ee0670a0db2@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
 Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Yi Zhang <zhanyi@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766039060; l=3457;
 i=venkata.botlagunta@oss.qualcomm.com; s=20251110; h=from:subject:message-id; 
 bh=7q9+o7KY/Qy4pzF2+VsQ5yxUwbBaD/W5k7jescl7Efs=;
 b=v8rkInL5CgcZZZvMO0StOu/K6sIaUsbER9QWkNYqLQ0+dJ6l61G3mD6ItJ96I9u/YmvmThdEG
 vnXVnw5+YvnB5psVbkKSRloXwjCkbGm2IG9WTfkkyT2qwi3OyPFbDe1
X-Developer-Key: i=venkata.botlagunta@oss.qualcomm.com; a=ed25519;
 pk=/SnYBwlkTzDCLnHFgEY0qFwPgKIV+aQWRbc3naiLzrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1MCBTYWx0ZWRfXz/B6OWOlK7NO
 bPkTzNaN8hBGuiczhpJSuIibte7+8p6TxufOO8QQRrHVeyWlek8GEpCxlDS15zsFKR0g0TqPz63
 9Ms3HdA3pJNL693GiN67bjSEanSLZcmwM3NiC8NLXOHbrF9SR1hP7Pnl3W9Bm3muz40QcNLmXH5
 dnTW58j3Yeou8xrf/kaDbv3HxsnPU9DLziJ8Xf2M/jfQLjZCsb6xkJmZnLPZ+PW3jVptamil7lt
 mHbDidVVgqwnMCETnK3KTmUPGopQAyqodZWC6iRBlCPtqpJdfnocC38/tpzidEQ10mkId7cjmKn
 aPPeFViUuTK5Fg41nsmRejZBDTOXcD6iemDN7Cl8TAAakfrH3+DrfNL+m3vxj1DIU0u62PXBvLF
 ydgkhehO7xQvH1H9q58dgwApASouAQ==
X-Proofpoint-GUID: Ik01FAeaN5lvdERm5HwXxU2v27AJ90g1
X-Proofpoint-ORIG-GUID: Ik01FAeaN5lvdERm5HwXxU2v27AJ90g1
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=69439e22 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=Xc6W96i5Xe6cDM1WBtQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180050
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
Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
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
2.34.1

