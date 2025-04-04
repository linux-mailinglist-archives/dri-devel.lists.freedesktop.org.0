Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325F2A7BE52
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 15:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23CA10EBD0;
	Fri,  4 Apr 2025 13:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FTgpPXKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC46E10EBD0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 13:51:02 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54acc0cd458so2550457e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743774659; x=1744379459; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BB9DHwK4cROLaWjJuAZunby5TnPgVp+XcunP2n/MOHs=;
 b=FTgpPXKLQ5H1ykCZ7lYOb1nGBgiQ2KZyBwbXjydcITVNtdYwawKNEqY2i56Dn3i6wR
 Ja/0H9GfODBVhr7+jXdijrnYWS996ipA3uN1FJ5Z5I9cAMudZTzySIF+0R8nZkJ5RJKM
 nbJeQJ4CUaeHl/aLLjP8erlIAog95svXdNEvj22yrCZkgm1LbxLn4Ho5uH7EDlGfLuQu
 Ns3PYfWXAGS9F/lP4/gtC1YLoAW9T/dfvWVUIVc+xz4PqI0Fllgf416vv52ik5acS5sl
 teNTgdOjDzWgLccvvdFTo/b03bycKJFAp06MfUutWyNyHcu4HZud4ntvhMZnBG+o5JiZ
 PuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743774659; x=1744379459;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BB9DHwK4cROLaWjJuAZunby5TnPgVp+XcunP2n/MOHs=;
 b=NBPRo0OqcqKjIhcrIhTpOPLu0DtVLxJu7nRW7jAnmc27ZjTjtHhy3MZClyvrRF825B
 lG0pabR8rPT19kk3kJCFQytVVOWFfACxfzJMJTb2FgvRTImHKkF90+HQVEu2aBHS11uI
 unmAZG0hIKQfUpM4/jD9bnvsZnc6rqcQMFgmYUVp1+bXbby49Lm0Zn71QZu/rDmUqQ+r
 zeICKw7FhiFCz03zYSzTP9Vlb3PTe46CXubZXZDdHcEChFf/P40EgTux6j/kE0A4ySgV
 VU3cqyzAzkFKM0iF6YXzWLM2xc7akdln6PnwKKT5YCakSZ+iRZ8GtS9MV83A883OXH7O
 5bmg==
X-Gm-Message-State: AOJu0YziUj56u6pyi7IBOgf9PA09fjvLZKIrBeWGFi6cMtw5fju0kaSW
 Q4JY/i66MJZPTPXiFKz8ZXER45fz6FzNMDW66wghX8o+yVywOmDVaAzjyZqfCKY=
X-Gm-Gg: ASbGncsi5qKYSiSQmXcO8C4umwacorYT1p7/KTgFJitNGoNmgBT6nmwefRrCcgNcPvW
 /ZT8eM43MaEUXUseV1zNKhd0zy8827AjDckyaWwXAkAYXo1Y29ExNdb5KuEyX6fbUbweBZpYPni
 tLMp5uk/tEdkJqdptFA+8HBvxnmZe2yK9jeHVZ56jk1YitohVVUTpD1/NaeloGxI61WRvOZxvqg
 WOoawphtNJVTgcx7gQgK06XLAuKWtiD/SbxWFR7MRQW95jCYBjrcpLdlhgvpnlGGHJcWyM0rmHj
 /zVGnF2/XSWWQtZuFaka8IIB2052SExPFJ4PwSZW4XLTjK0kZMZYcK0xsvPj0/tWr1X89pe2dHD
 dwAXAedpRye2qsg==
X-Google-Smtp-Source: AGHT+IGbNtBbpMpDg38XhE3xwVLelARt4F88vPDrkPUzpcNsJoq1Qb4B6PhcguN01yM4+cCMTfP8Yg==
X-Received: by 2002:a05:6512:3b9f:b0:54a:c835:cc4d with SMTP id
 2adb3069b0e04-54c227fec8dmr958566e87.49.1743774658853; 
 Fri, 04 Apr 2025 06:50:58 -0700 (PDT)
Received: from [192.168.1.199] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635c7dsm436687e87.144.2025.04.04.06.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 06:50:58 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 04 Apr 2025 15:50:32 +0200
Subject: [PATCH v2 1/3] dt-bindings: display: Add Sitronix ST7571 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-st7571-v2-1-4c78aab9cd5a@gmail.com>
References: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
In-Reply-To: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2483;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=dTeNBuF92gWicEQve9HvfkFWbBeFaR0CZPu1dkMadRI=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7+Ox6WSnTaTLBN+nhOZdUI1lP4wWs1Ag8cKq4
 H9/WQry65KJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+/jsQAKCRCIgE5vWV1S
 MrBLD/9jdfQW7cH75jvbHn7mXtz0l/UZuTKvVvBku4E9JL9Le1A6oq8G2wZERMupZx/dnia1uze
 AULVrB4sBO11MQI2uwCP3Eh4ufM1oCp9MDF4EFRDh0zNQr0a8BpGEntsohjMykSKNm772VLQZQH
 qpKS4nXszHyuAWThmYMludUXOg5qpLjI954ZjdP0xLjk4bWVlC2dCQugpKH4uckiO2uqyrEOn5j
 V9thWNQQfARC/ORm8JiDKOfczWz9o3D+/Tf43KjRR03lmcd1tcG/Vhvv3L3DabcEsNoDcbh77dP
 I06fL9MOc+D2HZGexEDDq+d7UgO2VjktbGCIDL6QzLhqEgXOACQ2crpQs97RbAdY8aL678lIEe9
 bYUfmeKEne7LilXVZiX7A8MFZTctjnQ8HE72dvwmuUJmLdC703HCkQGXKEsw1PryNwOLUFa7MGE
 SeV5E5p1rDQ7Ao56+a9ziYlQLgI+6twUgvJr5ep6NTdpSQfFe5+kg578fOBdpQsG9lN9jhkuqZN
 VsCpDDjlJEL5XUVALcBkZxUzWdPvU6HcDgjf7SZUP44V82PE/bJlfVbPGFpw5+PS7UaMkI9zrs9
 szoLVigdme+HNDiyGjPJP/Yx2+Ox75K3Hn08YnbKlOZO4xy5Z4vsO0TplzLd26hGAFIcjoMOFCr
 v2Ilff0Pzryp/Hw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 .../bindings/display/sitronix,st7571.yaml          | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..11575b820c59c5ada427fbb6b015c331215c8db6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7571.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7571 Display Panels
+
+maintainers:
+  - Marcus Folkesson <marcus.folkesson@gmail.com>
+
+description:
+  This binding is for display panels using a Sitronix ST7571 controller in I2C
+  mode.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: sitronix,st7571
+
+  reg: true
+  reset-gpios: true
+  width-mm: true
+  height-mm: true
+
+  panel-timing:
+    $ref: panel/panel-timing.yaml#
+    description: |
+      The panel-timing node specifies the display resolution and timing
+      parameters. The hactive and vactive properties are mandatory.
+      The vback-porch property specifies the start line of the display.
+      The other properties should be set to zero.
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - width-mm
+  - height-mm
+  - panel-timing
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
+
+        display@3f {
+          compatible = "sitronix,st7571";
+          reg = <0x3f>;
+          reset-gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+          width-mm = <37>;
+          height-mm = <27>;
+
+            panel-timing {
+                hactive = <128>;
+                vactive = <96>;
+                hback-porch = <0>;
+                vback-porch = <0>;
+                clock-frequency = <0>;
+                hfront-porch = <0>;
+                hsync-len = <0>;
+                vfront-porch = <0>;
+                vsync-len = <0>;
+            };
+        };
+    };

-- 
2.49.0

