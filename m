Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5562A97837F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3B610ED37;
	Fri, 13 Sep 2024 15:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O2mZ0a17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E31810ED35
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:09:12 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso31099531fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240151; x=1726844951; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BqCw/4kHuYfS+tegSJD+cV90aIl+wTusfRyt9G+zPuk=;
 b=O2mZ0a17y2ToKs+7Y9ST+7xOr5Jjlm/0qSZXgWIygWE/v+DVoRRf31SYz5IfWpR0Ji
 JlE4DNbfMm1Xurf9DLTi5skqI9pyr6vTtR2BK3ao2geCqd3TnbXqfUQiEYfXjUm6MkVF
 RAw+1iZS2sup/EzGdEPjdrvc4OxXeqk7qYZMP1lLrjeJwSYa1/6yKX0NDZIvhVVWE7Ql
 TBesl5KU4kXnoZOE7oUcDzh409oFPbVzJR1FaHFdc/2KjgOD6oO5VY8eMLKiCDENWSYc
 bEkBlKYvhMblpyrwGxtVRw8O+b6VZhOa4I1wSHCaoZ8DXGlp/8ZN71hLDJuQUL/o8aYq
 c7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240151; x=1726844951;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BqCw/4kHuYfS+tegSJD+cV90aIl+wTusfRyt9G+zPuk=;
 b=bb6L+QPtSIKyTyGcBS5lsM+6uY7Gf6mIIglTI3dlcdGKKIXbUF3VslUXftN/G4TF9o
 /Y2aSj6qFgWwoowgJTHQCXNEoGkfByVWrKKx0MYGZMKrTpnlLObsL2tXwLYaIxER3zz5
 RryrdwYuUfbaNjMdFGuZ9YCtVErW7NH81IPNgLvsGJeR5dMyZ+C/HPrOGJH69owDgGi0
 sBCqe01kRyarhJS1nr5m/qTekthEaut5UYbJe6GRIHzMcMuGY7h2uuw9T5YYVYWQ16op
 EVagnouQ855pRV2JSlgpSfsAIOTQNXU41cq7MJ8ovujSYza4D/E9mb+Na2/74GtDhkQA
 XLxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9vT0bLARWFCbRk2Bb+Dyk94+9bWVF2hcFfB2sM9GKal9WD1lht3e/033QmRzHWEyjGmDZu10r27c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyaeg2asw4uIlaUpCjmC+IyBv9GXLiI4dQEnUT3o7UxAlrHHnqU
 KZ+OCjVp0ykX7lZnvY0F7KMcI6XDa29QNKF2tYJJmrZ8JLhrS8J6
X-Google-Smtp-Source: AGHT+IG1Q7xjN4CCu4u9SogSo32R938De4uTV77FDjfykgt4K+bzKzlFr+lhvVtVxKIfcKXPkEja+Q==
X-Received: by 2002:a2e:1311:0:b0:2f3:ed34:41c9 with SMTP id
 38308e7fff4ca-2f787f32dc2mr31568371fa.37.1726240150365; 
 Fri, 13 Sep 2024 08:09:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:09:09 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:08:04 +0300
Subject: [PATCH v4 21/27] arm64: dts: qcom: starqltechn: add gpio keys
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-21-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=1745;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=o9Qd/8JMpOJPQYcP3TU2sS+epu62uYpYthXa4YYQCgY=;
 b=Gc/pkDKuxyPTs3pg3UWl6auHuVwfoE4b3u1agqq5dHZFsSc4ONRWz+4NC93OHSJAhu/oPayI+
 RcHdt2uTR0FAbMdall9kokXqK0okx2IEy8ANaIXU7dyWkzVKYBe1gYG
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

Add support for phone buttons.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 5948b401165c..a3bd5231569d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -7,9 +7,11 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
+#include "pm8998.dtsi"
 
 / {
 	chassis-type = "handset";
@@ -69,6 +71,25 @@ memory@a1300000 {
 			pmsg-size = <0x40000>;
 		};
 	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		key-vol-up {
+			label = "volume_up";
+			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+
+		key-wink {
+			label = "key_wink";
+			gpios = <&pm8998_gpios 19 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_ENTER>;
+			debounce-interval = <15>;
+		};
+	};
 };
 
 
@@ -417,6 +438,21 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&pm8998_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&pm8998_gpios {
+	chg_int_default: chg-int-default-state {
+		pins = "gpio11";
+		function = "normal";
+		input-enable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
 			       <85 4>; /* SPI (fingerprint reader) */

-- 
2.39.2

