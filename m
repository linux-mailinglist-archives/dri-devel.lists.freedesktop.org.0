Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7117790DD58
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D8310E7B2;
	Tue, 18 Jun 2024 20:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jaIDTjNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B81810E66E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:00:35 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-57cfe600cbeso767956a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719233; x=1719324033; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B9Gf8rtcSoFk0i/i8QsJvx4g8bW8LJTVUFR2J5NOhaQ=;
 b=jaIDTjNBbqlcwiR/X/XylYwB8/NPfk/Da4sJyXkRPdqqVAAZmeeUAKcs8hCQM1lqzr
 46laltApbUTVfXb9Dth/J+l4Ct5by4VMLmc5nmhL+y3OP9NRP9vNJUMe+1vN0b5IlKEE
 R5LaI1CLDNaf7+cQMiZQQBpo4mcolA+zyllhGUESOCvSmga0alA5pPTvlCP8D6KJgzZe
 CXfpTmJu76LrC0dTgCbS1A8Zh1zQwwQW+9E6Lc5NCc5i11UYBwNtKrhrxpXhunDcwB1M
 TPBxxwAc3i5fr4/BhfsgkShklXG04LYvRYEj+0iQ3kxqdRrbPi01IyOC0CNDPa9DP6qV
 WrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719233; x=1719324033;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B9Gf8rtcSoFk0i/i8QsJvx4g8bW8LJTVUFR2J5NOhaQ=;
 b=rtfcNvSFOQZ8Kw3QYTK/GWSXoy0bAykDW8wsEphil/VPPKjav6zCuc5WaHjelAUipM
 Mp4B1lqNH26UzYkr7NpMYOhjFuBC+1UAsZzXUXL/Pmb/zdEhNkiWEEcPOHrcXF2aaItc
 nZTnS7FApeEbrvaTgz6zmymtpi5BuwkibZUf6rD9WjmoI77n5KiomLTTqyLAXiL80d5a
 dRedkb1AyHLd/uFbChCN2HniFQdIKZLJgjOfuLfrPoKhn+H4SU0aS6U9e55cFm8tdmrr
 ftc0c/JsZLul+M0wk2RnLxR82ZbDIvaLjwXtNe1YaCdh3ah4nDjWzq38A6U9y3LHSWMJ
 w9YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQO8pNmO5FvCGDHHmoR/gowTfg0X7m0zCv+IUQ07PS5ZDV7g4nX0QyW5MNHMgcad1LZUHLS8O1XXg5Xvq8/kbVb6SjblYQkAaxXyZHT/8f
X-Gm-Message-State: AOJu0YyKHMlTBebxqvxJ3fWThlks9izcY/NhAJcmFLbiXyH1TA9HK4rD
 v6LxpJppD7aVJ4emFDgae9otMZAf8j5efqGo3mpsNmljefGN3yoW4yW7yQ==
X-Google-Smtp-Source: AGHT+IEzlujelQJZgkVk9tQETLWjgeiYiRGiSHlbCzMcWjnBZo37sEMYpBAy10o1Z/JwAfiRNQv5Xw==
X-Received: by 2002:a50:d51b:0:b0:57c:c171:2fb5 with SMTP id
 4fb4d7f45d1cf-57cc17169a7mr7086495a12.5.1718719233288; 
 Tue, 18 Jun 2024 07:00:33 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.07.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:00:32 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 18 Jun 2024 16:59:54 +0300
Subject: [PATCH v3 20/23] arm64: dts: qcom: starqltechn: remove wifi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-starqltechn_integration_upstream-v3-20-e3f6662017ac@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719185; l=998;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=MWsqiRVXsQwpa/BJsSBZlzlVtHIs1c7rhP0PmAUfrYI=;
 b=CAAGH21zd8iXQILS+hUtOdlu9JiX3XNwrCbwiN0odP2njtPSc+QFw5o7AN1NWe7kfsnx1w+NM
 KcvYyY+WBKUDjmAQvVktkCpOX6OsdZf3SgbEbhhMovjd6H42UA08T+G
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

Starqltechn has broadcom chip for wifi, so sdm845 wifi part
can be disabled.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index d37a433130b9..6fc30fd1262b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -418,14 +418,6 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
-&wifi {
-	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
-	status = "okay";
-};
-
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
 

-- 
2.39.2

