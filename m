Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614939E793B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 20:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA53210F198;
	Fri,  6 Dec 2024 19:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dlvi0sF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8EE10F143
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:28:10 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7fcf59a41ddso1776839a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 09:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733506090; x=1734110890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qKs6SqWvOBPQFDy0xdKVrrMMEBXzqiAL0Gp7ECA7uFA=;
 b=Dlvi0sF8g8AldzGGDc8dYczzcft7ArVCPmvNpdMivtM0QXXqWbe4fpx+Hh1BS5bo6r
 VZwfBoTy0YITAPtSAetj1XFhbrVz5R4X992kochwJq7UkvIDdEh3GilyIpo+c4OZ7YM1
 DRmtgkGHS13TCTOgj3TvEjl8SI9QburJi1/GiGwE+C5zgR4Qv5BVsGRUnLCcIfR4br9t
 xhV3RSmMp7Gu7KMb6n1fwc5k9mxxNfR4VPdvtBmHgZtu4ZTMZLdOHop6ybKhf8J98RRM
 pxvMkQg0m7//C/ezBBVg3FqOPv4myDQRozbvnZAwuBUGZEdkltwBfgt1b5WaEH8/pWlb
 Koxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733506090; x=1734110890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qKs6SqWvOBPQFDy0xdKVrrMMEBXzqiAL0Gp7ECA7uFA=;
 b=qEQJIywNah9bWrzLybSG0czQwocXcJJ2C7qanSrzx+23P/3S5IKhyULsw1YLU1qLii
 wNlvSUvO4H1Y4LEcu5GwIQ3OqiMDgPfQg8h3MhLHnEqqYbSza6hSnMornKt0CyOsiLFN
 quyo1CgNZtLxz0vvtl4FtW3ed4ZqCmmllVdGt1tdBd1RQaeaF0lZQ37nJ2lprJ13TkEw
 HHcCAS0SOC3XWZl0zKwsPgovAYsuFWfxaKN5EGkdWDX98aHgwMPJMfJktx4OBk4vAnTt
 MXDAEV/juPtywIVJuI0d1xWGkKVIUSosKniQ6870/bSWmw8PcuEIfNAWF/pqMv0Cmp3S
 gA2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg8fMAPdOPmRpkLzh19rLPRu/KO4dD9co1si18/995qwzlUfWiTAC+VsmCqwH5ghiQg63dbJf5ayQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTaVrRKyOg1H3OEWMg/523vHIFqVA6GuoliW1pgJ7hAGsnkNKM
 vWRdQCeEFfpTcK3XjsOYOAmhBocDOIMqcrEXUIulMFC0cpuZh3RYa92gNw==
X-Gm-Gg: ASbGncvRCLlnmET8/eP3SujBYrTCP1uV3GysJttKqdV04rFhLDSuMvrlE0X4tEtcNKb
 y0xf1K+ITLlsYRwGyrt3J3FynlrQDIyC4hnLtBsN35U4n7gFPwb9ckfLbhVm8cENh7/F+O72Hns
 khewAUgGsxNyQPvJNrA9D/jxVRVvuIwIP9f5rS6HtSlY3eMpzLBMEGEu0EwiQjaGjU/x4X99U2Y
 XAoYpx+srrGPxWLQVLzHD+Godt494dVQM8H55Mi54tr6qa1uqmiD+f8y/5BPXiB
X-Google-Smtp-Source: AGHT+IHkO1RmdNJpR/98buAGJm0YvKeK4V7vOM0AkKSIB8tDWbwjkVo05dKTym9p80CfxeZrKTxMuw==
X-Received: by 2002:a05:6a21:9a01:b0:1e0:cc8c:acc4 with SMTP id
 adf61e73a8af0-1e187136d40mr5795557637.37.1733506089650; 
 Fri, 06 Dec 2024 09:28:09 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 09:28:09 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nick Chan <towinchenmi@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: leds: backlight: apple,
 dwi-bl: Add bindings for Apple DWI backlight
Date: Sat,  7 Dec 2024 01:24:33 +0800
Message-ID: <20241206172735.4310-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206172735.4310-1-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Dec 2024 19:45:35 +0000
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

Add the device tree bindings for backlight controllers attached via Apple
DWI 2-wire interface.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..fa3789b0b043
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/apple,dwi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple DWI 2-Wire Interface Backlight Controller
+
+maintainers:
+  - Nick Chan <towinchenmi@gmail.com>
+
+description: |
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
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
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0 8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.47.1

