Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC5DA3557C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 05:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E4710E462;
	Fri, 14 Feb 2025 04:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="myc1atAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0D910E462
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 04:04:07 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-21f48ebaadfso32507065ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 20:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739505847; x=1740110647; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
 b=myc1atAiIUOfHCrg2Fw9OtqvEj4cektsgbspNfmGRBzwzcydjAKSZoUpVGwkp0bxcE
 BFWp+jH8FM8IoRqqop6S6bOlvfrSa8Y7JlVrUmw8FgMJfOyV2Fru2ZU01uG/eufh7yx+
 EnzGXNegleiCkERXCs0QzCo9IG9vA4WylDN0X4+O6wbn/S+0wXme7KVPCUgydifKEA4J
 r8EBmMG1Cth7hI8Lq5fD1idFiUVCuW8chVRoqeytiazzlAqU6JtZ11y6dEDrinfPEp0j
 kZuabLGjGwZbisOsmnYRk82KFqB+VKE1tGfqs2XOmhwR9SeKclfLD8NBXBkwimgVMNRF
 5/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739505847; x=1740110647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
 b=cUYOIXdPQhnvzyfRGAi69ay+tmMZ2NTSC3cnZijEtki4h5d8bEB1fzLpAoWXc8Xs5v
 Yh8zYoqG9X/QgYjxMbGauqTZ4kBku9LxSqq5YeACrYRqzGhNMixEyYqVUNKk0Tre1+Wq
 CEstbLMG6v4HgEkzoc+EgbAIc2BArUVmoi4h1myf/7L78A8k7+n/hxYbBmWmbMct99nP
 54dOyemBJ4T/OgpIfYfU/gyjuQYJgjv5P13/RdCh/YwhN6nvrkB30+wUUhg54RM95X9B
 mYfJvavp86fkEnhxR2J03kfslDZvN+DNORT8iVqfwPRQ5IRHZ9zAV1sGW5dXdIPvtFKv
 3Iww==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6lcVhvdKtztOTH/Ik9R1/xUOI9W++7waXAG42aZsMLvQvIrCBD1i/HR9gqyTtoL3eoxI1frXjXXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiEMyFvFOFo49pmi3PCyZSUXVQc24fGW6qZO4/hHzcds6Ah2Ol
 YtImjeKtW+HEAldxDdrxmiHZ3HiN33lpkjZL1QO0gx4iEkOik9mq
X-Gm-Gg: ASbGncsKSw8B7hXld179kcBQb5m1BLpiVv6kOPWnJ2Ko7x9bJtNiHDigpKotpcvgz/t
 rWEJl6KV28aseAWzpR3m6uURpSeMyKwrjDGqeXcEhp0dtbohWJKdMkqtEvfjfKmutbO4/n5knQy
 I+0eUQBrAcW/8BWn/xTH2lFnJ0kr2uYEEz+Kbk59AxeWepCeTmlC4iCwsKLW58JBYX4UQ8lNfe2
 RmyM+2yI7KkN974Kb3tilfxvDbWCAfyg2vDvRShXkZ+d5zNtufRjo4wjKxdMoHnbw4PjrTZMRuD
 c8lUOBvKyYmWjxo=
X-Google-Smtp-Source: AGHT+IGgz94u5dSaKE5PwBYaLjtoVurlg0X6dABIb3PB35R+FknVncdnfvcsPkYesVe9CLDNkNni2w==
X-Received: by 2002:aa7:8894:0:b0:725:9f02:489a with SMTP id
 d2e1a72fcca58-7322c3f4d96mr13423478b3a.17.1739505847127; 
 Thu, 13 Feb 2025 20:04:07 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 20:04:06 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
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
Subject: [PATCH v6 1/3] dt-bindings: leds: backlight: apple,
 dwi-bl: Add Apple DWI backlight
Date: Fri, 14 Feb 2025 12:02:12 +0800
Message-ID: <20250214040306.16312-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
References: <20250214040306.16312-1-towinchenmi@gmail.com>
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
2.48.1

