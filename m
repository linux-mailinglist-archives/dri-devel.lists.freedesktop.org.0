Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907F4C89058
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A2E10E572;
	Wed, 26 Nov 2025 09:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvatAegm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FET05ZEP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B52910E572
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:42:03 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQ9L2fN4048393
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JJkgW/Uvf1cq5FzERoTioInV4MshvX7rg+ISf0Tc/jQ=; b=hvatAegm9j/RX6Wb
 97zkFE09DunLqK1t7gU6iYvloVe5Ml9F2QWtLhtFnYDB2IBlb31w7poF+mnU231e
 dELddOLh/IL9w0I6Gh+OFVVg3xjQU3GgVeME3S5q/44AAU8REbWCD9629NndApVx
 1Y0CNp9WyXSgus9IwXaUJU3WRPW0YAWEe5pHIXF1JZ+vbglIE7kbi/qowgilgMTl
 ny8ER5JuJKFm865XlXfJUA94SuC6M/18GYL1RFYVrxj0saEzEmguyzSIc4ytJMg8
 fwlW6CWWOHRdqS+DRXrhA7H9J7//Oyr4amSjgqeYG2LGjhV7J+lFEm59+3HsvqMZ
 WUqlIQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2nhft5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:42:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8824b00ee8bso98598346d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 01:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764150122; x=1764754922;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JJkgW/Uvf1cq5FzERoTioInV4MshvX7rg+ISf0Tc/jQ=;
 b=FET05ZEPCHT/gcBXvtWq8S+qv0TKjFMM3r5R62bxzQdMErnneTqm7A0ZWnBlcNT11N
 yLOG+Z2QVCyGUu0f0uA+Y0UoZwAlH15iYm4bFlx8WIFEzMqOQOv7w+NY3vY4Sbq1T/Xc
 8l534L2kvbHqVOo2lzuFNSd3DsOaoWQ0g5Htbei10aS7IdpXtvRkZp5GPt9s4/KxMhbh
 0MK5Xd1V5XxN7ARCvDCqVlsX+dTLXY3Pf2zXBagS6jCu9DnhH/iTy02UTgZH7imvm9oy
 hNBWW9qenOnMgX5de4lPqRKMIobHHODWXba6BNxcFjqscpHsKbGTTTQKhCYoiFxB07Fb
 n4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764150122; x=1764754922;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JJkgW/Uvf1cq5FzERoTioInV4MshvX7rg+ISf0Tc/jQ=;
 b=WoS6dl6FfYxJf8ICO22oGSIjwtBrODiz9Y5feWlQM1Y5EVz8Z76ovD+A1PRPjJu49L
 yl1GGepo3XEg/LAddOz1v51nmgL3yz8gclIVYsmtxQQMdu8LagoxPyYNu+1CmDoWO+ey
 d6IGf8MWIfnsrMCgC3XXeNCooaNiNDnocEFKmTUUO+I/W3Kztv7bD5WeLRsBQDYaBjyG
 pE0VGGN7oMp0AL9M2qwCcRed3caRG7QFH3jqis7cPE+al0nA9IAPiqj9pT8EQM+vaYpa
 qBHrZGtizgmPe+vEkoSKas8twYUaWjP5hOdIRjs+rto1FoptijBQzCSVMel1UDmkKUI9
 xMNg==
X-Gm-Message-State: AOJu0YyKUb9fEpxlRt510uObNMgUpCVtASKAExCMY5ZqCKmOUI/Uzfb9
 KkU4MVeRDTzeppdupWDhm/pfpZXDXrcBG7TBqgehXwp3aI29OMQpvvp86INryZIxvf1swuVH0B1
 0C1LbINey6E08jp/gxu7FSsmV0OdTKZ1JYB8Agu5sgy5f0VIEqDeFef09iMwhfVI4iFJ6RRY=
X-Gm-Gg: ASbGnctQu9mAqptA+Bk5mP9r2Gl8GsIFzk4cSN6G8qwmbYjwFGcoh0pIXjPc+6woW94
 Soe0NMsv4HF7jFu3kpYKiWsCoAqe+NQhdgLdBwOMYP6WXnQjcq50cj9YpvPFtFXKbPRQxl7UzvE
 Q7G5pSbRDIckHlcDhdXD3eUktXmLmWbVc+BQ1S5FDPIiS9+eXbrh7MQcwqyoaObnm1MCjl8wpxo
 eZecRf7lIBSX9xjwsmNYrRFikk/9sYXGHhf46ucYxFOiwe/dULvW+6QpqUw7iCbk9k3yHM3uxmk
 XjiyWO9xc9cPl16/lou7EojDU6fUgRGKVdXWoZdqCnxRJYlkfR8yKGQXVxTBu0RK8oj0LuN+cF7
 q8hEvUnQc3YJvzXIU9DzF8j8mKQa923DNDAR63J9S4TGRuaMNejHC6vtgbPODNpSaC3LVi76B5n
 aVCAnGqMMtekPJqmgEl5KhTYI=
X-Received: by 2002:a05:6214:519b:b0:87c:1ec5:841e with SMTP id
 6a1803df08f44-8863ae886e8mr90713866d6.8.1764150121475; 
 Wed, 26 Nov 2025 01:42:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGC5djSElZsKO3EDcFcfPi617QMf6JHLy+ZCw0r27LCZYcjpxFAaKu0JzF2v/wVweu3a2cxyw==
X-Received: by 2002:a05:6214:519b:b0:87c:1ec5:841e with SMTP id
 6a1803df08f44-8863ae886e8mr90713396d6.8.1764150120843; 
 Wed, 26 Nov 2025 01:42:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbbee86sm5772682e87.49.2025.11.26.01.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 01:42:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:41:56 +0200
Subject: [PATCH RFC 1/2] dt-bindings: drm/bridge: anx7625: describe Type-C
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-anx7625-typec-v1-1-22b30f846a88@oss.qualcomm.com>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
In-Reply-To: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3940;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PEszj94UmZrlOqu8kjPM06p3g5SyuWzzyqxwFEqmxnw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6ba6bRssQeqcj6b7rLaCO0L60k8JJpme8ViR2pz+4pj2
 lqn9nJ0MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAicQLs/91fFodYy9e11jF1
 KErtCsku5Vxiv1rDWCuvctlD9XzT1kSH82Zi+RKPHrWKLY8T4ZONnSn8Jbdx54HV7rrdjxTvnii
 4s20V440Tj3ex/L50S3kmt7Lr/MpvWzp2StUZJsh7HO7gffLQiX+V18kLzxzmqiyoKqrUkP1cMX
 uP42/Nsu5LUobxWu/KVIs/lmc6rPzfIb7u+ZrpmmeNf6zXjy81VzzZvyjXjynmRb9xrtafe/t2P
 uJeUnVxW+pl5tQYzi2BgR9UrrntkJz9a/WeX87LJ6tO9Ve7oHpngdWZW7/WystdUGzQnJFlz9hY
 VmbqG55u/dN/9edwx18lXh0+1UWVdlc3h8xeybiqhjcZAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=6926cb6a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eOiPeOEgsxahVY17qz8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: R60HmS3r46C34Pbs0jLRSFfgKI0lP8Qy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX3oQMA/XI+pN+
 9JTxM5u160Rw3nN4bPY7niN/UwLgwu6TmjcqS1Db2r60OZJegaxzoUT22tIkkxBCB8g2hK2IglV
 OkSEvq4dN6aS4mFmBKtoC+oONdP3V4WjoizNRN4wI2QQR8nJlRtctoifudK9n34/SD3M4IUKfm8
 moBGq6Dz9+8gRUT2dZbB7ssxH6m+i77wZpabQZ42NAzPDPcUkcBnQwcCTVNNAS5qOFiDNxCWIb5
 h2lgp5+bbMRKmWR6lT8HeuGNjoUYZknZtSU9cnatT02D0it62F3x7N59pbDU6KROP9RBlG5Q5LE
 8/ECW5uhRy+HCtfNMDSiQN4FKjRwcLmFdE9B0pBRQ0oVWCbn7VbSnQHHD9gyjmZ51KXqiMa5m5n
 q7q6XD/9XsvxVqvRxcgwq1xEET216w==
X-Proofpoint-ORIG-GUID: R60HmS3r46C34Pbs0jLRSFfgKI0lP8Qy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260079
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

ANX7625 can be used to mux converted video stream with the USB signals
on a Type-C connector. Describe the optional connector subnode, make it
exclusive with the AUX bus and port@1 as it is impossible to have both
eDP panel and USB-C connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/bridge/analogix,anx7625.yaml  | 98 +++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index a1ed1004651b9a8c13474d8a3cda153a4ae6d210..6ad466952c02dbba0b1dd9b7de11e56514a438e1 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -85,6 +85,11 @@ properties:
   aux-bus:
     $ref: /schemas/display/dp-aux-bus.yaml#
 
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -117,7 +122,6 @@ properties:
 
     required:
       - port@0
-      - port@1
 
 required:
   - compatible
@@ -127,6 +131,28 @@ required:
   - vdd33-supply
   - ports
 
+allOf:
+  - if:
+      required:
+        - aux-bus
+        - connector
+    then:
+      false
+
+  - if:
+      required:
+        - connector
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
+    else:
+      properties:
+        ports:
+          required:
+            - port@1
+
 additionalProperties: false
 
 examples:
@@ -185,3 +211,73 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        encoder@58 {
+            compatible = "analogix,anx7625";
+            reg = <0x58>;
+            enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1000_mipibrdg>;
+            vdd18-supply = <&pp1800_mipibrdg>;
+            vdd33-supply = <&pp3300_mipibrdg>;
+            analogix,audio-enable;
+            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+
+            connector {
+                compatible = "usb-c-connector";
+                power-role = "dual";
+                data-role = "dual";
+                vbus-supply = <&vbus_reg>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_ss>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_sbu>;
+                        };
+                    };
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&mipi_dsi>;
+                        bus-type = <7>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.47.3

