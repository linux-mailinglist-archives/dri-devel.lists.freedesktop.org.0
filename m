Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B219ECB58
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 12:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0756010E3DB;
	Wed, 11 Dec 2024 11:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ksyMxF8k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C07D10E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 11:35:36 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2166022c5caso24520565ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 03:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733916936; x=1734521736; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qGkzbcqvOFspYq5q3MXmaYRhS/5bP5b3n/UA7OPeKfo=;
 b=ksyMxF8kGIi3NapOkRmyBTiA7nxjbGHT1yzBHQtkgp8TDkio8k+wjgc7DddhoskcCf
 /MzmoKJpSSQyWa0xjIN5IjWuTZnBwK9u027ISYmHqgkCHwvzvO+4RQUnQ0siKitswLSu
 BjcDGsjuz+qo+pDPhMVZA5RfpRTogKFW+OjIqty8Q9qYg/sv+gAvomKkk09w0xN+4F9a
 L2P3eSPdedcp703IEapoAZVtI8QCGpVRo7wXpDcB8zOZB+tbBS6T8h7ve1UhUR/5M/FC
 goYrwvaQTuF//Ca7xye3G6MWkmomUlTjcFv/ePPdrqT5c2Yk3NoEbWNNKldeZAliqD7B
 zk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733916936; x=1734521736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qGkzbcqvOFspYq5q3MXmaYRhS/5bP5b3n/UA7OPeKfo=;
 b=dic5NSIotqX/2eUt32JRXtI9GYwK3AjCn3LkuDyB8DjJg11JtKfh2CxvIRSY0nhKIX
 7l/PwX8IPTrLOHLza6QquywFFINTpVZZX+pEX/DKtvqLI6OX+3+abJKXW5kD6WnVKyRC
 GtfnGws97r4Zs5ZJc09NRrcDe9Y4WDzuKNc5aMkEmhZIPfro77ljinYjKnDUgBDV01eI
 OxN4DTFpXQyVA3WYnkjDgjt5JqXcHbCqoqGnKUmUaAqEXCw8WZLvyPTVccTfQ1X3L/lb
 k+m84vN/h2BjciAPtuZs3HeLQV+z7rtbuPjMDWfdXT+QRqgrvYrcIqMieIFTxCSPKJ8g
 TmHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0OnsucPiylMfUZC86FhACWaD3P5ijreyV4sV2c5gPSlbsSOJnNNOQuQEg4/5QIYyYYG+gcmJJk3U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKTEtxcGoLGWP8+9Yh8pdUH23fsoU43mTpKJjIy3e86HRqchfJ
 VfGfkWXOCPvnlTMOk9KWUneMBA6F1Wi9Eg9MVrwDQzJbJ/ZfHZTx
X-Gm-Gg: ASbGncuVyKJVvL0IDpuMRtqLeTFcuze3v3YKsF2EdxKk2OmjKPt6FPoqyDB9+A7yvpU
 5Ke4m9SathNv78F8RkdloYXAJ1eEdU5zKBvinPND8zMXVo/fKycBXczJrmvnUl9Fm/ZDAI0yjWv
 6iKx8/32wVXGyO7pmiN88UHBq8HJLIM5YZEBUxSTnvhBegxZMErxqn/a//LuNWIlTo6C3HBVrz3
 GctxrQcwMoFOCLdtjMNHv2u73qUBXFfP2pxQnIjkTh3P8wceJfE8AuDR07pr8+QUgmAEw==
X-Google-Smtp-Source: AGHT+IGMlkuqj5IDE2y2hs5ggKANhLCOeqY5ZZVSTXz3hSFIBTS9nP8blx7hzXomQHBVRniqPWetgg==
X-Received: by 2002:a17:902:db08:b0:215:e98c:c5b5 with SMTP id
 d9443c01a7336-21778390f29mr49010095ad.1.1733916935857; 
 Wed, 11 Dec 2024 03:35:35 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-216404df131sm56765635ad.203.2024.12.11.03.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 03:35:34 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: leds: backlight: apple,
 dwi-bl: Add Apple DWI backlight
Date: Wed, 11 Dec 2024 19:34:37 +0800
Message-ID: <20241211113512.19009-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211113512.19009-1-towinchenmi@gmail.com>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
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

