Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E787E90DD60
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD7810E7B9;
	Tue, 18 Jun 2024 20:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GGgSUSqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DABE10E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:03 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2e724bc466fso65303341fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719201; x=1719324001; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6A3+2iwaC1/XVmavDthDLZ4K+/3BScbJzSpnb3NVRSs=;
 b=GGgSUSqpvA+rHt2usX7tK76Qnndnls1EMdXEyjLYplgqHtRxhJsZxCjUxtFExFHeti
 M22+8ooXemx0LzULLcbwCpncWpL/2uPIx/CAfFQOVVFutmn8KrvUYAc3UhCe839QlFO/
 nj0/Wq5orG/dhlUlh4hKJ0DLmi+I5ibihqn2ckhxZcOKUpmi4W1r0Y4O3qmGV8wW1GI3
 od+52Mbu8KyxRjyNV6cYyMgDs69axkfjkCQZc98hqlWqWfJwaUayMylWxW7+ty1lA7Ye
 BU6WK7k4d/30Z+mJyAIrHsFQrZNZaNVixGTSBoxJ2orAy8dWoXTvUPgljGQ8vWxv6lPR
 dYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719201; x=1719324001;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6A3+2iwaC1/XVmavDthDLZ4K+/3BScbJzSpnb3NVRSs=;
 b=NK6BEiVVjQ4Zev07jCe/CiCXO/Xw0UMs3gmbBFFAfJOOOYL7VpXGbqlOfL9h1ojClv
 noekvCVHHFcBkhdsnPKVG97WfaVb/G9PnqoqNq2e99cfEGJSW/92yghiV3906POeq+Lk
 9hsfUUfcVEOAt08hdyd4Iedd7sjfrrgzFumXoffty7VmKK50wiK17tM5hKoD5iDmMbll
 3Y5locssWK8DcYcmcMQa2nIlbSGnEILFVuu5aKp79T05MzdfqYfyzT8mlOZfbYHR0Gzu
 hvB1hB2HoHiCRU6ccZqLQDHFLTJ60lNuNQquMmjRnaVZ2qQLFShEwQhd9LpwkiJW14TG
 c17Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbPonX3MLsoaqMxFogf7oPPVBe2fPrr/NLf0TSTt6ppxsnJLK6fSTI9/Rk0XqOJ/136ogM12qRmgqt0p3fXmrvXtp3Eg7pE8L5vaHfjkZz
X-Gm-Message-State: AOJu0Yw4YJHIVjhtHLv/fPH2SQFnlxMNrgn4xz6Mbbdc15mXKWmPQwli
 +l+3JTAwRuYm3t85oXU1FgE3deiWpTb0l2hcOxm4ttBnyhvhdsFUlWEBDOwK
X-Google-Smtp-Source: AGHT+IFlmX/c4ZFv+qoeEd0Kwe0J+as2CgfWHsxDLcBiN6HGFbLvve0i3HX+10AQGoM9rdBOnoEHpA==
X-Received: by 2002:a05:651c:10c4:b0:2eb:d4a4:42a1 with SMTP id
 38308e7fff4ca-2ec0e60e835mr100649901fa.43.1718719200637; 
 Tue, 18 Jun 2024 07:00:00 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.06.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:00 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:40 +0300
Subject: [PATCH v3 06/23] dt-bindings: power: supply: add maxim,max77705
 charger
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-6-e3f6662017ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=1332;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=dgJy+BucY6KOgzZn5R8UqVuWZVsOdC8WyvzpCfw1lYE=;
 b=ZwEhTU12BEK6xZcNcocP5DTvk5amgaqarmU36A5zA3ClN0GV0Z6ITAzUiQWgH2ylIrVpipKEi
 es6j/VVP+FPBYMiD8HDlU4v3vRWPnI/6v5pYPLRLup43GxlOqtUOW5+
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

add maxim,max77705 charger binding part

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../power/supply/maxim,max77705-charger.yaml       | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77705-charger.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77705-charger.yaml
new file mode 100644
index 000000000000..2b805da2a328
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max77705-charger.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/maxim,max77705-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77705 and Companion Power Management IC charger
+
+maintainers:
+  - Dzmitry Sankouski <dsankouski@gmail.com>
+
+description: |
+  This is a part of device tree bindings for Maxim MAX77705 multi functional device.
+
+  See also Documentation/devicetree/bindings/mfd/maxim,max77705.yaml for
+  additional information and example.
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    const: maxim,max77705-charger
+
+required:
+  - compatible
+
+additionalProperties: false
+
+...

-- 
2.39.2

