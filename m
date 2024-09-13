Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2169F97837B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9233610ED31;
	Fri, 13 Sep 2024 15:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IHfMi4EL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C5E10ED31
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:09:03 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso6420612a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240142; x=1726844942; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BXU7Bk7WbuxNrJusNNOpHMNB9jnyfgFFtQVMoYQpR+c=;
 b=IHfMi4ELtw7b5+KV68FMDOKzjQEgY/vfy+ZbZjn4ZRj5Eqn2t8dLIyn84di0OqB70N
 ztu29LJx1lUR+HtlVww/iUOxLmvFuXTBOYGUDFsvQShAYh1ct4rr03k07N+BVRW+X9Xx
 CguGDc0ICFZ13/MHVws8vYhY8t2QXUrvEmAP/A3999lLBjotp7iwwNWW4+9w6ZJBZuxR
 1SzWX2G30X8opm0k7DrVZaIlBpl3WMZ5vNKY3XziSvkOImwVayufGXhYQUJ3aUDQsRmE
 WDbbh/w6DDqsL4vmc+PoCoMIOf9iVNZLPUKQd/k0hqv1DgL+3ZIisJIHuULCJ93qNg2v
 +1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240142; x=1726844942;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BXU7Bk7WbuxNrJusNNOpHMNB9jnyfgFFtQVMoYQpR+c=;
 b=ZsRgYpsK/8Jq4uQZzAgqck+KF0S1RstI7gaI3JhfjBMhpQBIxZseeaSRv8xc9rAtwJ
 bcl9T7uCABd3wmc4KnOT5QfHoY+RJVlfd6vKV3wjg9/T18tDhygvxDai1SQShPcuoOEH
 HSf2dyROKILlTWJgdQCl66zH7Wz4jC79DyzBeZASr/g1CKAxM6EgU2+T5+Ryh2CTQN8Q
 7OUlQRBW6sXzdFHxiY5w9dJKHIBxcuhdi4uh0pEHGhzF2pMAI32eFnzUiRoQ0URDRGYT
 tVEqVjxMhB8VziS8L86D5hOQGtuoCZY60Q5UL0pgBHUn3KOdNWUbnoTVxblbcMUasB2/
 oJLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF5V+472anGRZuZPRi4wzdsgkoQGD7HaoMna935lYBjDlJfxFd4QSLQVqb9BAD4UwKjyLpV73DFXo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwjNIhsyJhCuDAWUXhgzNh8g+A9fSSw/bMj22fEI1JHEu+Zkk0
 Txkix9aAevEehM+DUOX2i1PYJnbZBjyc44jxo9Z5/bt+u+G4gyzU
X-Google-Smtp-Source: AGHT+IFPFN2hgO9Tc/ykeRzTBK0HjTBEB69PqXe0jnVSoprAC4LV1n+xcHFAg/BqAAvInrtE8uuQOA==
X-Received: by 2002:a05:6402:4144:b0:5c2:6f35:41af with SMTP id
 4fb4d7f45d1cf-5c4018e5d05mr17183384a12.16.1726240141881; 
 Fri, 13 Sep 2024 08:09:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:09:01 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:08:01 +0300
Subject: [PATCH v4 18/27] arm64: dts: qcom: starqltechn: fix usb regulator
 mistake
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-18-2d2efd5c5877@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=1140;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=HSWoKU+U+LciT4YeTMc8x2BUj723ugWiGdsGsQ5TSgI=;
 b=D+7T9Oxef0XYg20n1/Xa29buVBAn6lwn1W7nUsmHfsGRH87CSRz/m/NLhRujUszUERs1tecW+
 t3C465cB/vWDAK9O9guDMz1HyewrsAqz5qVyv4APhCKKFgtGJkHCywI
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

Usb regulator was wrongly pointed to vreg_l1a_0p875.
However, on starqltechn it's powered from vreg_l5a_0p8.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 6fc30fd1262b..f3f2b25883d8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -135,8 +135,6 @@ vdda_pll_cc_ebi23:
 		vdda_sp_sensor:
 		vdda_ufs1_core:
 		vdda_ufs2_core:
-		vdda_usb1_ss_core:
-		vdda_usb2_ss_core:
 		vreg_l1a_0p875: ldo1 {
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
@@ -157,6 +155,7 @@ vreg_l3a_1p0: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vdda_usb1_ss_core:
 		vdd_wcss_cx:
 		vdd_wcss_mx:
 		vdda_wcss_pll:

-- 
2.39.2

