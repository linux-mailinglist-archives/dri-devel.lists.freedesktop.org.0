Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE67A08E9F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 11:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C32810F06D;
	Fri, 10 Jan 2025 10:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IJA2VD03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FED10F06D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 10:54:35 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-216281bc30fso36875945ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736506415; x=1737111215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LMSCq8ZRhOoVCRQ+Pn3L8jEsI2Ad0rp7ucXL8/818XA=;
 b=IJA2VD03vsTt9q8Q4KoDJv31WmMmnkxVEDmwn+NOVredVt5v4FmQD5JtI1xOahe5HX
 aoQN0LuvqLrA4tJrB1R4svRFXVo4wDLGx64K6086nUbbnrgldW93AgKbq3xzyUKf1RcW
 6Culci7p0gCeBGHjjV4utxcdS5hfsEvcwilImY8BrPvPwx147IIFNHMN0nN18es3z397
 +ZEu3r2kooMrn+vq7L/HW1FxspgDXl3iYgre6Ko9Y88TPuRChdzL3NoU6tfx0oPwEko1
 bSeQSePU4tNb50cMkGOCmIL4ZwOQUDk3qz+h26uOfb+TSd6w+XW53fEm0oyvq2LEgU9F
 Z9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736506415; x=1737111215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMSCq8ZRhOoVCRQ+Pn3L8jEsI2Ad0rp7ucXL8/818XA=;
 b=sncngRZn0pmAhA3+y/kb3iQnq9gk20f7TAadh0DpUpwk0+f0lXon8vgkCYn1+S59ag
 HosLpNcDzrZPh5RLB8vxA8dJwJGE659YUVGIAElbAfaHW2ajnb5HZ5vvxV3gh0EUfxB9
 gLSXyCD+J/UWlrGBcdqby0Pw6vO5xQPrWBWWwzvhEZOEvA05uXKTSpYMOdSX353l8WkV
 WOdqch4L62dij7Zm7zwTdWT/Y45YDyiVg+mt4RC1+LYMHXsY2V2O+Hk6884iRdE7AdZv
 wQ3cTc0PGWb6MhaYBjuNRUAU+91DZ57FGDYLtJtCMuha8vR9gS9o/teBTpkKJBrsinBm
 x05A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYi94xgVbGkdfcQ38TVcaVq9/ifEv54TQXfhCQqBEt5n1wO7K0vJp3ytpeN/FIBgC5F//GISfFbTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfjjlza1QxEpDSjrgxJALB77eKQJ8XJuv2xUuRu/O3ksMSNCBi
 R7QRwPM8spK9S4ddIDTNdOrvYC66MZqRWmZDl1peZ+b6ZKN0pOcN
X-Gm-Gg: ASbGncsh6p++KrXHOlMyKz3wNajvKdEuyRzK2xQ0euC8q5YfA4JZm3c/vgcZ7WFedvp
 M1ND1eVv0nJ95WrjjQVmOame6/DXw/mrZN/eR2s9XwnvsCnLyTaB7bBr8Bay8bxZ3ExzRrhzYmU
 GPeUVo68eGbXQbF7mhfm+v8TRVpPZbrnRoobXSH/7G2R/d8NcQ6UjKdpR3RndWe5XsF6aQG2e5I
 LQfQS8jLo0jqciEohtcr7lEx/JBbI+Ua/RQoqEFNFyfHtqdPy38Tsm25w==
X-Google-Smtp-Source: AGHT+IGa4nMEUy38XaSxRcOiqyz7zYEKvL77D4BJO3pJ8lZTFzoYDKUJd+a0uiMcMH9BGkGZ+iGrIQ==
X-Received: by 2002:a05:6a00:1152:b0:725:f282:1f04 with SMTP id
 d2e1a72fcca58-72d21fcf2d9mr15063399b3a.18.1736506415194; 
 Fri, 10 Jan 2025 02:53:35 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72d406a57dcsm1333403b3a.170.2025.01.10.02.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 02:53:34 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Nick Chan <towinchenmi@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: leds: backlight: apple,
 dwi-bl: Add Apple DWI backlight
Date: Fri, 10 Jan 2025 18:52:04 +0800
Message-ID: <20250110105304.71142-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110105304.71142-1-towinchenmi@gmail.com>
References: <20250110105304.71142-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add backlight controllers attached via Apple DWI 2-wire interface.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..29caeb356e6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/apple,dwi-bl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple DWI 2-Wire Interface Backlight Controller
+
+maintainers:
+  - Nick Chan <towinchenmi@gmail.com>
+
+description:
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,s5l8960x-dwi-bl
+          - apple,t7000-dwi-bl
+          - apple,s8000-dwi-bl
+          - apple,t8010-dwi-bl
+          - apple,t8015-dwi-bl
+      - const: apple,dwi-bl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0x0 0x8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.47.1

