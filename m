Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6894CCB855E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 09:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30ED10E334;
	Fri, 12 Dec 2025 08:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ug7UF4cN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AC810E371
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 08:56:45 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so7211545e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 00:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765529804; x=1766134604; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z0OD6Tul6N7Ac9c9vQK1/GWaIUr26ez2juaXAYXKN8s=;
 b=Ug7UF4cN+LAGVV+deXoxCMTQdMIj9OtYTJu4z+OhxtRfUKXWC6N8Zbx+QtybCn44Sk
 glGz31bjV8yI9gfI7kTqZoG96WFRFrMDdvYbDGpIwGUCoYbupXqHfV6LHRnYOKtU6Eig
 a8ga51THq83ba9VvFWKJOemuY4G736N0RUYiXN2chXjN/P1fzj0zGZNrKQU3i8awri6R
 NrxaUTx9bRMmh8WkqM8dv4f+D27RV1cKe6X+uFORFxWxi4IA1FHqiWwDtyXuW97Aopdy
 CyZ4ManVNtSarw/XPlFi8Omi/gQSrgPrDfPVyYuxZwFrLsbV4h3sUKZ/Xk2CKgVUecJj
 Uvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765529804; x=1766134604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z0OD6Tul6N7Ac9c9vQK1/GWaIUr26ez2juaXAYXKN8s=;
 b=t/h3cmBNNV6RyiHDbGTk6c0VXvOJ3BAfC3WGMPI1qHpTiqXIPbqCoVRRb9yeimES06
 2KV7hYzXFCaBkkZtyBRPSq0aMi1JReZ9CSouStOdXtf/qRcyxzCoMT8GY3k7qlznC6Uc
 g3XQg6ZEeZGAwQyhBBQfY3YbHmF3jyUV5ZTA6Z/qRW9Rgs16OQ2rEXFe9OPYqPlxzb9u
 n8LqHLK4Gyu2FycjeWh/R01AVg7X0KZx9pCoKNxOYYw/5wfFfEmpxRq0MWIP9Oq3eZPt
 LG44yHVjAFuTaPAumD2I9cb7sKAiVgy2QJyt60cv9ut4DvToBvamtEqRAnfD67AVx8bh
 181Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsse24/Fwn8W3oCBubVoDJX7+uqKzHzDceKDmX5QD+bcgdc2jX0oclM+GeLratt9hDf1Sj/1bKAHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfImIAz5s8vLbq7YNGPgOWjH4iwsvVNjh+X3yk1nL7Q2ufS4Mu
 JWoa2ojxVN0IR6er//X+5V/Op9p8LwNCOvdJVGlJKWic8qMULHdIg3RC
X-Gm-Gg: AY/fxX6pxYet8IcE+eLaXXtci5uL5jwi3kp8gwVpa/Vi51C1eKFvr3kB7W6IkNTgxuz
 rZqPN7/C79x5vXsfiv+VcaVGxI3OxSdb8QpwBNCgUM6imHhmscyD7S5xoFKOkIzfDTVy5rfrhGy
 VvUplPCB9/vd2k6uzc/YS/qe+lNkhKOt7osONGnn7jq5AtyAclnXK4/k6s8C967fhmi/UH1iU0M
 TGOb7QnGt36rFsISligWEFRx4vdff41DkPUXs7wB0zWFiRadjCUDMiGjLwXGEJrIJo+aLgkvaNc
 7XWike+Z5tiPxJUPJiXfrnUddnku8DJFSWjx6r8eqlTMnVwq3wR35Yzzlg64GvKkcqkkhRfeY/n
 G3p75oLJdizocLZlEjXXkQyT1gbViZmteT/UQot/J3AllUs66NsEL6rbRjAMY3P+j2zlcZKyCCv
 +5LvsC1gk1VYx/sgYipzqfGGDrUxex8R6QAvgWE32+j83mrKC+ZH8IC14K3g==
X-Google-Smtp-Source: AGHT+IFmXYiSLQj87nLeQmFDWekCNP9ctv2fCyzAcsDytW0W06jV7mNDkwob74x/eZBohgcebOgFNQ==
X-Received: by 2002:a05:6000:2411:b0:42f:8816:c01b with SMTP id
 ffacd0b85a97d-42fb48e773dmr1244823f8f.63.1765529803714; 
 Fri, 12 Dec 2025 00:56:43 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([89.7.8.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a09fbesm10501696f8f.0.2025.12.12.00.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 00:56:43 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 12 Dec 2025 09:56:08 +0100
Subject: [PATCH v6 1/3] dt-bindings: display: sitronix,st7920: Add DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-st7920-v6-1-4d3067528072@gmail.com>
References: <20251212-st7920-v6-0-4d3067528072@gmail.com>
In-Reply-To: <20251212-st7920-v6-0-4d3067528072@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
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

Add binding for Sitronix ST7920 display.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 .../bindings/display/sitronix,st7920.yaml          | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7920.yaml b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c4f006fc41e1f472939725bd82b86a649f9b3f56
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7920.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7920 LCD Display Controllers
+
+maintainers:
+  - Iker Pedrosa <ikerpedrosam@gmail.com>
+
+description:
+  The Sitronix ST7920 is a controller for monochrome dot-matrix graphical LCDs,
+  most commonly used for 128x64 pixel displays.
+
+properties:
+  compatible:
+    const: sitronix,st7920
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator that provides 5V Vdd power supply
+
+  reset-gpios:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 600000
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "sitronix,st7920";
+            reg = <0>;
+            vdd-supply = <&reg_5v>;
+            reset-gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
+            spi-max-frequency = <600000>;
+            spi-cs-high;
+        };
+    };

-- 
2.52.0

