Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEA09FDEC6
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 12:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A95810E29A;
	Sun, 29 Dec 2024 11:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qrcg94I3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CBB10E29C
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 11:15:09 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso102113095ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 03:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735470849; x=1736075649; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V0h+wOrNYOq1rWia66zWwU+kYGms7B8E2S8S2isesVU=;
 b=Qrcg94I3YEC+NHkSDJ7vOvoQ1FZdsN/0ML7zUWBUEPoZmmAud0MEjKrL60AAbSo3ry
 NijyejoWFmlGrD8fjatRxTYwQScQCNsB/gXoYc0Ey+ammzgNN+8MBCQ0zoTOdBsv/icZ
 0j7DU0R79gk6AiHAHsBrYM4M7wLid3Ka8Rd+OLyKUU+MjQTG/aDLo402Z8lPNZ5CU3wc
 JllJK5hZccOlZSwAAWhSRZgdaJjqnDk4JiwKL3qhKMzCDmEC72eFC48pFtV728dmWRq4
 D+8g+04r6fb4Mx+DBR7uJM1fqv0YNRJTWGbz/q45WOmiSb2z0V2SuKaZ+vrvXVOJ4VkX
 8zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735470849; x=1736075649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V0h+wOrNYOq1rWia66zWwU+kYGms7B8E2S8S2isesVU=;
 b=ELfhbVQDOfIDzpWFMXRjcAZ8wtmRPJjmbOgMmkJt/2aVt6El/moGOHj9QQBrG1Fqa1
 d1okR+j3my8g0PhYfsbvDcJWGx65AzpIb+a21gbWLY/xBXT+dzqKHPIREjRAZ0/3NJnD
 mFakubHe1cfqMeb5AX9IWD4eXJbXBUoJ5L+X+rHDQLJqCI7ElrSMc3DSusEgGH7kcUXS
 jU3gsEw2xkoVRxL4cdWMe+s6yRKWhWWemaAv7jU8fy4X2h2kNIRwKr1bkZmTnBYXX2rT
 koSKnjkmzODbQ+dvqkYkTQq9obAbtrR9KuglNNPjJvjjO7LiVRIO5plqGBXfCrZBirQo
 MqjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbWOR5nK/M8vd0dPTsPf1HjOyRzgqGO39fAMyKAwyXfONxKbwG70FPVTlV2/CJ48gXok1+gBmbW0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzIGUXPN5AHIlz7aZyxUm0bonsfV11fXQlaZJUyIq//p5oCpSw
 qlwbYnOQ5bF5OcyNLXArS7t9AAT7JBumq159lc5q1BMpS955mVU3
X-Gm-Gg: ASbGnctdavqWpgBtEb4OISlPCjrlrNJz+pG/QgfhnMp8qd84Zs1vw13n6EXwcyNNY5F
 u6HWaclwwqYrrJY0oRWy9aAasy6gxsw1k7L5TO4ymIIblo4zs8m71GROSkoQU1mvdjKNm3jJea1
 1e40CDiEbd0f7KI9/5FFtdoy9mKCJQiexjDcbftmyNH0YJNdmewZSl7zB0DbaCRSgd9JhxFbmUm
 5v/kabK6A3dkuPuUQykkibVN6kSRZQrPROaKpDnMv6hxi+UNW7BXqkxGQ==
X-Google-Smtp-Source: AGHT+IHw2F+g8azy9+A2CTTjFUe3/G4dCC8p/k0dOHQU8Dj6MYf/830XflujqJ4t4aGM+bWVkhywyw==
X-Received: by 2002:a17:903:94e:b0:215:96bc:b670 with SMTP id
 d9443c01a7336-219e6e9df70mr420824845ad.18.1735470849111; 
 Sun, 29 Dec 2024 03:14:09 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-219dca02544sm161655895ad.255.2024.12.29.03.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2024 03:14:08 -0800 (PST)
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
Subject: [PATCH v4 RESEND 1/3] dt-bindings: leds: backlight: apple,
 dwi-bl: Add Apple DWI backlight
Date: Sun, 29 Dec 2024 19:11:17 +0800
Message-ID: <20241229111322.4139-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229111322.4139-1-towinchenmi@gmail.com>
References: <20241229111322.4139-1-towinchenmi@gmail.com>
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

