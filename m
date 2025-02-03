Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E394A2588E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 12:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE1910E4A8;
	Mon,  3 Feb 2025 11:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="giTCQ0t1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B3410E49F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 11:52:29 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-21661be2c2dso69923305ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 03:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738583549; x=1739188349; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
 b=giTCQ0t1rcWBSMLCgjTnSQnQrT79Cy3cYv44ko0+gldjwZn77kxL7SL136adcyMVrp
 Vm94fMzABPG/b8quiyPmoCg5bNQtWwca/N4ESRCRLduN7qNwF/9vTet1Ldn/9jEJCT34
 0y6kya5+8iyNgV71qJRrU3jK85DDvcsniPmpim28Qca5CX8FITUoZlL8/1xUsx1ctfpC
 2RNP33mHGFPrAmN5pvDOhdU9PTVWXROlLp5M4JB2m4uUbQcge7AZTjamyVRu+oj/nrpl
 haL86G4xtPisOCqoVEc7MVVhseoLQNprPBmF8bBZjoTNBSd2NyvLz8g+kJTOsZpEzXWM
 Hp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738583549; x=1739188349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
 b=NwMrJIX9/zRrkLHlLiZCi2WbnOiLmmDe6gzKx4UqDLewF8maDBDYgcoAQTCwGXFMAW
 tHQjwSfM01L5jD5fyuPNWZ8jA3PaeQNEqRpGA0tu0Ybgzjr1UTc3WlkRTsn0cWPXdfG3
 U1Io/gDfptW83Z4+u+6JL32xu76BVMZqBa4ILe4P+hxL2lrZegzvdJwvGsXTa5VriX2O
 oVciswe9dcJTGSEaApHlgRAi/b7YSJzptuiPjyYTXKPIiuDyHInIJM9/9jQlygpGahQv
 5yNVkWU/Q/yrcDchBH6KzxixToCbQL7xBhxqJdLLFmI6V/qAvHQwGnCIpF0/EGNUauIM
 cIbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVZ6mUCiH9KE8ZqnpEDgoE51m1r7Ha8hQYlWdRU8X/yi35OPIOayxfO3LR39jbOwJd29MeHhs6Dwc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0ED1XICl2WcSIqvrKRBHcfP4kJDXXM1LoGdAhiNBUp7rDzPk3
 6No793FWS9KximvPS3DdxAK7zAlURIOwKTvLLiqfdgDw3OutyOS5
X-Gm-Gg: ASbGncs294py0ZIJtXbK5LbmRxVbMhdO/fQXSH/6Tr1uYmTx0b8G2sXH0AlRVVAcnAA
 uIcDl6qpaxEQDrhTVHHSzqHSk6omWrSehGcq/OGv+ifP18Z+7w1NJ3unq3VyMcTyM/ekDoCLfqS
 YjggTy+6sCmVzNXHXcExHLbLHnww/pXgBGe6EGECgXofgzs2kKikGio+96Ed1T9nko31R1D6m8J
 p+kpD2dsC763PSXrXtU0P1KV3vQGCaMQUoRHkNLTultJxb5xO1TICSbY36FoQyFoQMkNNhW7iaj
 ZDcMBZGA9WFc9R00
X-Google-Smtp-Source: AGHT+IH1MtQsv7n9+03TmRQLhZL0KNOrrS14baU7/DtFKLh1qhS09XchSBq/EFGuV307S9+ypU09rw==
X-Received: by 2002:a05:6a20:cd93:b0:1e1:afa9:d38a with SMTP id
 adf61e73a8af0-1ed7a48c85cmr32676039637.1.1738583549287; 
 Mon, 03 Feb 2025 03:52:29 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 03:52:28 -0800 (PST)
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
Subject: [PATCH v5 RESEND 1/3] dt-bindings: leds: backlight: apple,
 dwi-bl: Add Apple DWI backlight
Date: Mon,  3 Feb 2025 19:50:32 +0800
Message-ID: <20250203115156.28174-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
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

