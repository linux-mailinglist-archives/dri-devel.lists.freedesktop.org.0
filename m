Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F1490DD5C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB1D10E7A4;
	Tue, 18 Jun 2024 20:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b8hR7zqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D3A10E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:07 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe6392eso7346561a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719205; x=1719324005; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=amtZh6cok3kVxxh2UoadCf51Ge+lbZ422aIWYrzWULU=;
 b=b8hR7zqUW2zfjyScjNDX0LuCfmHiEVcpQGggBQ3Qx7qPpVJj/L/JOAxpqV9zdua/qf
 ypy7N5Y0FuV4q/vpr4zBmHYICr1XDV72l9BDG5mhtM29JWgFPQqTobQch8+Bi134hL/y
 O9u8NQXq4uyQO9BdgW5g+MUSK+yvvs6hFJvMQC9NgRUiYhU24bUF63rfMFlQ8+dFVex3
 ITGuxlg47j3KI5CnuBHix9lP0B/d/Za6mMfjproqXoo7hlDKmfWCR1EhvqYnrU1/9mL4
 L/mnfoe4EwhBcpQkzW0QAPRYiYuVHW99kozva5aygBoicva6rkM9oEhDENFSFPtpq0Jj
 3VXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719205; x=1719324005;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=amtZh6cok3kVxxh2UoadCf51Ge+lbZ422aIWYrzWULU=;
 b=d7MLgogtymkIfweKHULp7Bw93m8uOVuWyEkjuo2hr8Hyu9hAkYYvxNgyyHKLNG7Ras
 as6IfL+A+/fJsFI0FruHjU1cOXd3uMd2cLsfERIpvKn+JIIVsN/dxUnKJnFmr5lnfImm
 ZDrOh7DhHCQxENvHLQkmEXxYHf6gLGN0J+HJHKzZ6pASMB+eylZwNAF28GyqqBNDNjiU
 WnlrsSdK9R11IG0J7dIMvJmNil59OxdofnsGwJ2S12mEz1LPJ1Fxxq8U63OSnAXCeVxP
 4KJUEEckUn0XVnXQ/xTcblOudX4OjR0qDSqTo1QaMWaOaFruuji/X+oYe9yOCH0QvC1C
 sznA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd84nedaDrKw1iNK10b8UGBKSEZwuTUwLkHrE+JOVhYJEFPhL1lyW/WGiEW3rroY8a9cIoxdBPcsQTq5N9tQFZyDqR0AvluaY1nUkjtvOd
X-Gm-Message-State: AOJu0YyXgeNzJPuBON786HEQlQo4/0GxOYqZbYTuUdnW8oXdmvsMrTZA
 RrmC8x0Iuv0oen+UBqOaPE0fAgWYwbMrvdFg+zsafvWYQpMS5fREznjgvcaO
X-Google-Smtp-Source: AGHT+IFacU/UFpIwaTa6wZ4f7sRQWphBmkbeBykRZgSzZFVXbMNWcd77zosms23rqaQYfYGh0AnbgA==
X-Received: by 2002:a50:bb44:0:b0:57d:57c:ce99 with SMTP id
 4fb4d7f45d1cf-57d057cd44fmr206656a12.2.1718719205082; 
 Tue, 18 Jun 2024 07:00:05 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:04 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:42 +0300
Subject: [PATCH v3 08/23] dt-bindings: led: add maxim,max77705-leds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-8-e3f6662017ac@gmail.com>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=1609;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=7GuLNZWYidLfySwdnHMlO3cKyzwike5F0Axou4kYDbM=;
 b=wXF+V0LgvlhWhOUO8mOS/t/tdcu8fI/3fxi/NQRj3GlXy4qHn3uq8gHX7IrZD2ooIQihcNAZe
 045YHR9yMxgCijG6bla4uPQq0zI6T5wO2cJU1U6TcVPhCbOH+3UPBUG
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:03 +0000
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

add maxim,max77705 leds binding part

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../devicetree/bindings/leds/maxim,max77705.yaml   | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/maxim,max77705.yaml b/Documentation/devicetree/bindings/leds/maxim,max77705.yaml
new file mode 100644
index 000000000000..7c512545788a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/maxim,max77705.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/maxim,max77705.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77705 Companion Power Management IC and USB Type-C interface IC LEDs
+
+maintainers:
+  - Dzmitry Sankouski <dsankouski@gmail.com>
+
+description: |
+  This is a part of device tree bindings for Maxim MAX77705 multi functional device.
+
+  Up to 4 LEDs supported. One LED is represented by one child node.
+
+  See also Documentation/devicetree/bindings/mfd/maxim,max77705.yaml for
+  additional information and example.
+
+properties:
+  compatible:
+    const: maxim,max77705-led
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    properties:
+      reg:
+        description:
+          LED index.
+    unevaluatedProperties: false
+    required:
+      - reg
+
+required:
+  - compatible
+
+additionalProperties: false

-- 
2.39.2

