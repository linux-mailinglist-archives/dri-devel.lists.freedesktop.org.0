Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B12190DD44
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B636110E7A5;
	Tue, 18 Jun 2024 20:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dDLV4KfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F7E10E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:04 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-57c83100c5fso5996511a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719203; x=1719324003; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DAPyRIfn0zoFYR6H5DZfvZ7lLQ098EkhxsFz4D8wcf4=;
 b=dDLV4KfEK6KRt9bl03HIs557pzXwFReE5J38ZIVdidFq2zEJFF/pLeBFnlvxavXe6l
 fJL5DShPot56oC9sWR9ZFSlQ6++xjV3pL+hfuoyN6Rwn5HTyxDqfsSLe/4BOjXVgcPhR
 sjZ/u/cXx0Exn9SiBa++mcW+csc9+ddSTWIxsiOw5K6D5H80ZD3XbZpGvSja66oVwSUH
 gkWSt4W1rs36IpxkhqarNZPVNXEeD0rbEeFUGs4lylJT6Gy8c58iq6djvDOMQUjQ15EF
 3ILJC7gb/UNuStKZyioF40vRLEMk5PM31P2gHalHodFRJk4bo9/IAte4LiCoe0Pj+zP1
 sBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719203; x=1719324003;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DAPyRIfn0zoFYR6H5DZfvZ7lLQ098EkhxsFz4D8wcf4=;
 b=uO8/tfjnM5TjANf/6WeHoIWK7PjAtpbvFya2kzt+qK7+TLcnWeNH40ul0IshLt/Evj
 tJ6xcK4BCb5RhDNa1tLCi83W6PM/fCxlwVuGn2O2peS+8QwE3VtJRfjAGyXkCwGNbUJJ
 uZ5TZxMmazrApbXlfmoNEjC64hp0aWJnq8FzUJhd+GwpyBKIWd69p3TG9G7V2y3UiqYL
 N3tpmR8NIQdCwpkY7bGJyP1BzNMHt8sTxwQqsRrMN0sXQyuF9mnVjsxcZvrIJxE7Obxq
 sLm+E62HL1VzSmEsdl/pDVUr9zkNo0cF4h/o1DUc2df/cDz2/29KOdWnzAMSaLyHMY1p
 Ocxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0zToKAP967oEwGGwbqTsoc43UvkWJ1vrouFTvYmWDq7XkvZI7iqRGmM/qnOxd88M2f6MbTuUzuvZ65IPIYRWimnsBgNwy/rHVr+Pwt5pY
X-Gm-Message-State: AOJu0Yz6HQn3yKa5RiDZ3gc2Zj3qWaT38OuVlKrBQMn/9x/8KTC4Sqhv
 sfA65Nbgg6feEQm4wwyHEqXVfKd8+9Xvefp4cEzJHwWxCO+x4mYuuIIptUqN
X-Google-Smtp-Source: AGHT+IG+4lLZCtVPgURwIdcirf4nRr/hvjtf29y9VmITCHT3oab1SqgnU6wHrBAh8A/Xff1ksbBLsA==
X-Received: by 2002:a50:9f8c:0:b0:57c:73ff:d13e with SMTP id
 4fb4d7f45d1cf-57cbd8b9c60mr7324128a12.31.1718719202882; 
 Tue, 18 Jun 2024 07:00:02 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:02 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:41 +0300
Subject: [PATCH v3 07/23] dt-bindings: power: supply: add maxim,max77705
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-7-e3f6662017ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=1491;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=kcP4CRKDseKYJTmDRkTK1Kkwp1UjhNtI1X6qAeNdmFk=;
 b=/cukwzpYHF5iN3FfFAFfgniEdjw64YdmmzDzpAuzFjD3j6+McSzPALs9l5MdhIDFnxkIqnEyv
 8YlqGe2NodRB8QMkSwE+giD0jR5APPEnJte16G5TK7KUZcHwrklY4zl
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

add maxim,max77705 fuel gauge binding part

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../bindings/power/supply/maxim,max77705-fg.yaml   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77705-fg.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77705-fg.yaml
new file mode 100644
index 000000000000..b24db0aba0d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max77705-fg.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/maxim,max77705-fg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77705 Companion Power Management IC fuelgauge
+
+maintainers:
+  - Dzmitry Sankouski <dsankouski@gmail.com>
+
+description: |
+  This is a part of device tree bindings for Maxim MAX77705 multi functional device.
+
+  MAX77705 fuelgauge with ModelGauge m5 EZ algorithm support.
+
+  See also Documentation/devicetree/bindings/mfd/maxim,max77705.yaml for
+  additional information and example.
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    const: maxim,max77705-fg
+
+  rsense:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Sense resistor value in mOhm
+
+required:
+  - compatible
+
+additionalProperties: false

-- 
2.39.2

