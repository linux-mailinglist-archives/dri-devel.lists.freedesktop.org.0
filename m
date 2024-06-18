Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452DF90DD49
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C17F10E79F;
	Tue, 18 Jun 2024 20:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wqi6PAlQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A33B10E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:13 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-57c76497cefso6477747a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719210; x=1719324010; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VgQaqPAPGb+bVEVj1pLBF0jCvf+qjPwOAsG6IyI58go=;
 b=Wqi6PAlQhBLeSHkerrdUu/8fTNB52H9z7gCAE1RFGy1Sfy4lqIX/rZ0nnfA4NRpJyW
 2NX6EsbhCZRfUsyaJGJQPyT2Mhm14zINr9OWyIf/XaM2LA/byqcERWohZcQnsSMv/+3S
 Cnzj42F8Fqj4ZtjOG9BS/Cui/4LCm+3VGgdnmFDewq8ANrxWLd75P6S5PJx7hiD1R5At
 Sq4mzPvxnuUsHyhSM0BeSF1B06FnujFvHalptsjHsJ8Ani9QcOF4DmCnYFl1EJdDf7Ad
 vvjkfA9FPkKJ3KylnrxTjAhxB9gCKmEatQgFvWK58K4JeM3NnXZ7jyCUo8I8X6udrAHC
 lG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719210; x=1719324010;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VgQaqPAPGb+bVEVj1pLBF0jCvf+qjPwOAsG6IyI58go=;
 b=KCCay9BOhiB/78VrDVk3+5VolNt5nM4F/W//14F6mFv4gbSln9iet6gEOBQkoc5nGY
 lHKsLCLeibCQoQMZrpjdIYYLeM8LHybS7mbzVX9y5ZvP7mKbEKyjtFPHVxuDgIyEyvTn
 XlWBlO+LVRo+vj60Qdt4B6C2RB9xyWHmZ6VF+6I8MVyjzhrtScpsIWY7KK+pbVUuSCWI
 QeRPyfVPqSNRQjl49tiYL5UBoat1tjCQPfjih9EvCDJsn2HhtT9oZwPnJrnk4hQTo6rn
 iG+FMsnKmw1sTUmGpiKy016H6oe1xIIMk3am4CSpiwb7OjSEkUWdownLtfEJ2jAwiZsD
 Lumg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtorzEoFOARQOI5vZSr7psPrx1CHJSQujoABqNwiWn8nKxXn8vUY84ZM08whSdlwrGyPHX70Yc7j+URzeLWxtR8xNfbUwSrhvdQU2aWcjY
X-Gm-Message-State: AOJu0YxSLoC2OJwmN5Ong/9R3iry/ruLQv+yKjsAR0LNr0GfoUMJORA6
 WLtt6GseAFU+ny3Jg6YmHea9HmYbU8LEtLpgSdKHhaoQKI6qHtOsn8CC7S/p
X-Google-Smtp-Source: AGHT+IFsZidUuDC83rllt43NgpoJnd8N6/Hume+DefHGadiO2zxz9M/+d8rv7TFSqTnMWzBCuPFhMQ==
X-Received: by 2002:a50:bb23:0:b0:57a:858d:20ca with SMTP id
 4fb4d7f45d1cf-57cbd69c599mr8823023a12.28.1718719210215; 
 Tue, 18 Jun 2024 07:00:10 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:09 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:44 +0300
Subject: [PATCH v3 10/23] dt-bindings: regulator: add samsung,s2dos05
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-10-e3f6662017ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=2160;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=Y66wFEa+/wlFCoNMgoH3Eo5OCF3K3Yn5Lu+5vfjCL2I=;
 b=MmAiVvvAM9kzhQvdhIh8BbDA1BIDVVPqgbidWXVZE2dtgE/cQvJDFpkqRG+X9UEIjnWkq+0i0
 EOqftdFX7nDAxqiKqhazJW3wsRUQmc2W+ttaYnbp0zIj8+YQVSN8guB
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

add samsung,s2dos05 regulator binding part

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../bindings/regulator/samsung,s2dos05.yaml        | 36 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2dos05.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2dos05.yaml
new file mode 100644
index 000000000000..4b8e4389329c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2dos05.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2dos05.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2DOS05 Power Management IC Regulators
+
+maintainers:
+  - Dzmitry Sankouski <dsankouski@gmail.com>
+
+description:
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  Has 4 LDO and 1 BUCK regulators, provides ELVDD, ELVSS, AVDD lines.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2dos05.yaml for
+  additional information and example.
+
+properties:
+  compatible:
+    const: samsung,s2dos05-regulator
+
+patternProperties:
+  "^buck1|ldo[1-4]$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+
+    required:
+      - regulator-name
+
+additionalProperties: false
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3ab41e53c9fc..92a5d0a56353 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19900,6 +19900,7 @@ F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s2dos*.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
+F:	Documentation/devicetree/bindings/regulator/samsung,s2dos*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c

-- 
2.39.2

