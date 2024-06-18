Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD9690DD5F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEC510E7BA;
	Tue, 18 Jun 2024 20:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AuxoB54y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424D810E68A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:00 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-57c76497cefso6477381a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719198; x=1719323998; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Upy6fBZOR1H2GEGfXG5Z3nttQhCGYdXb6UIkk48wC28=;
 b=AuxoB54y/BkCa1Nc5lFxomgH1ILqwNnBhnrmq3Jxr9NHQWpvyEiZVpkQijzVUYliH5
 Lds3+ZnixkFKgzbbNHEfWlHEbDE28QEcuwAv5PUIQUP9RkMAxRYcl9xYqUCwA/n99xvd
 kJ1tQpB9YPBOxO3+YJHcAnOPlnQ+EkX7HVWJJW8fBgBD5qZPFTDQPR+hj49amRXkxnp1
 ul95dh7O4NIZrsXJPYR0REHWdsj81ooOYbYmhb5QVBLCagOasGdC1egBteago/yewQsY
 kjUok0UE0DEiOjjDWjQA8yrCxlriYAqAysxcX+12LIhyuL1oLCDOJf+AF1ndExLeD2S/
 XMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719198; x=1719323998;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Upy6fBZOR1H2GEGfXG5Z3nttQhCGYdXb6UIkk48wC28=;
 b=k9sy6MzOURd+rnbZaHdi8mjv5+4a7CLIMQ+UPCLQ72xvywsLURvDkfQoM2o2uUD1mE
 fU6QNtXSsPkV1334s96IY1KfHnlYBdJLpIS+KC4ai0XhY6PqjULRA+ydrQA5KE1TY/pY
 Ql7znxLZJExk+FX8IMkihzaMPfVp3n05LXsx8xgY0Q3A0wzli/LhSJ44f4bTwCacOEL6
 YCbeQDCJIvlH0z57MXZycaVUJn63qxgGVWCx/+UjdaTwlRa5aXzceOVQ+uNOWG9ze/Ew
 qlebOBQ9I6zOhekEUVLof7laeowvTDUsUUnzC4JMMwzhmZJK9mG73EX24c1dcomAT8ZF
 m5Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO+OOhaFASyLm/IEijDy9OdRGFmUGqcpLEiLDqhuu6yxOr7PDm5j1oAqnKMtlcCDtqK+7nJYs71S58LAypNVFesTk9Q6lN6Dm3nKfyd8lB
X-Gm-Message-State: AOJu0YwNNtxL6XkHiAjN2ZEg0CHio8YvTsBeTK1lgDfN4qPt5Wj/R5AB
 eW1N39T5MxeLUyIEXRPIndi4NgyerPFJw2orWMgCG8J8qfU/GvGxP8VknKe7
X-Google-Smtp-Source: AGHT+IHMqfIH2/+QaLV+rotp1RiZdfhBoayjQhqdenR5458icQCIvicX3Uj89frks5W/jGab9ZLt+Q==
X-Received: by 2002:a50:c31b:0:b0:57c:ad11:e755 with SMTP id
 4fb4d7f45d1cf-57cbd69c382mr9094793a12.33.1718719198162; 
 Tue, 18 Jun 2024 06:59:58 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.06.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:59:57 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:39 +0300
Subject: [PATCH v3 05/23] dt-bindings: input: add maxim,max77705-haptic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-5-e3f6662017ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=1304;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=qthIpOYuUqEKsnF/WfU6OBlZPhcwRZUIhgo+lk7uE+8=;
 b=wssyoJ3JsY7QOzBApfw3BG68MDFIQFbKUYMtNH4F4598qUtec5ADE8WPLKSmTw5VIE9HxgqOW
 mZhnDxDmJLQBIDXpX/vHZ8MCzqNHjA8MVN4AIUp8pKkFz6LyoXbwdZX
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

maxim,max77705-haptic is MAX77705 pmic binding part

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../devicetree/bindings/input/maxim,max77705.yaml  | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/maxim,max77705.yaml b/Documentation/devicetree/bindings/input/maxim,max77705.yaml
new file mode 100644
index 000000000000..8f065a2fe7bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/maxim,max77705.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/maxim,max77705.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77705 Companion Power Management IC haptic
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
+properties:
+  compatible:
+    const: maxim,max77705-haptic
+
+  haptic-supply: true
+
+  pwms: true
+
+required:
+  - compatible
+  - haptic-supply
+  - pwms
+
+additionalProperties: false

-- 
2.39.2

