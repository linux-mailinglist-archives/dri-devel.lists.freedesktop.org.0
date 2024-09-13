Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640197837E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D3610ED34;
	Fri, 13 Sep 2024 15:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ko+Tjo4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B565610ED35
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:09:09 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f752d9ab62so12227501fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240148; x=1726844948; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=55ASwlpj93CUVgS/uPubEqfpV10Z+LfDh1X/v5EhTrc=;
 b=Ko+Tjo4MWhfFLdAHsoCQDM9TBOZVeBbtkrHDOQdkPtXqt3QrcKIP7Oly0UDep3Nj6d
 rdzqL5u7HAxtoeTCHJ9tJFobfGCQZ/ZMUclVhwNZpbflpfchJjpjrXZwcY4lFlTLuN22
 6BJ1pMItlq0z/qmre/WV9A1uCrSX12g2q+tmI+Wk/zCTcOrMo2TGRxuVWh/aiIIjTrYF
 +tHCSQRg6HXas/18kLenI62UcEK7WNXy5RW1XVWXGm/1H0o7GRYFhn1p5bdS0P0zkHo9
 biq9SpzImiu+HVZ1gyUpsIyuQqoKLchX5Swwp3GVHQKtzu6HQcA+1l3l6uI72bYwkJNv
 CUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240148; x=1726844948;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55ASwlpj93CUVgS/uPubEqfpV10Z+LfDh1X/v5EhTrc=;
 b=dr9U3/8ig8PPxuL8lSYXd/HJgxsStfSAayDJRBFFzqTNg3HSr96O8T5aiAwHNLlxdy
 o8FoHjdd2DBR4mAf5cTu1npzZdlqUYdoG6aUDEHotLDt17cOzX9KzvTCF9BrmMakO69G
 NlaXzZZmk1Ie5jnoHXDlnsDddt/+AFrnQBwddcptyenjlTGg68QODb/podydl49QP27l
 fh47S089M5aTb/2q6jEkyZgkF9Ot1IT4G9rhWU0tk0fiD0APo+//pMZh1SzsNlbqk+A6
 1xIr2/hNScKVJmH+ursfLE/il2PPIVYsgohIPYHQs5Ql0akw4ITR0doJyEx1vFo1ro+2
 V3MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeVfnLLnqBQqwMvR/SSfK6w62gqW5XstOhS7/a7I6DAuyZ4rckeMbIW6bkWy9URlepW9BDV2S6tFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKaIYibCJh4Lhwrw3JjechndP4NY3Zn4Kz3rb8YgXZd7XF1bZn
 6c6dD1y2Y0n2QGb+LtYPZuFZ3774rbOVZWgvuwi0E4LBLq+5U3pL
X-Google-Smtp-Source: AGHT+IGTgrigkN3pYFgry+y4pbIiHE6qcSI1txzxF+Y/VDsmiKk4E4issoAeEk9L+DNueAZu2NHRsg==
X-Received: by 2002:a2e:a99d:0:b0:2f7:5239:5d9b with SMTP id
 38308e7fff4ca-2f7918e095fmr18494721fa.4.1726240147864; 
 Fri, 13 Sep 2024 08:09:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:09:07 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:08:03 +0300
Subject: [PATCH v4 20/27] arm64: dts: qcom: starqltechn: remove excess
 reserved gpios
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-20-2d2efd5c5877@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=1067;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=v2ECB5b4RvqZNQX0iHQLIiWI4r9KcdLBWF4yxk3AOSQ=;
 b=4rmtARmU2EIXalBZ1YEh56okxvR/WWLGICjzf9qlRYTxw4Wc2L5F5ymCc5pFjSqPbYSbY8eqF
 A4xNCOKo9FLCLQtQSVVyxjvBnH72jTVfhz9UR6iFZq/Bu+mqtgmcbo2
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

Starqltechn has 2 reserved gpio ranges <27 4>, <85 4>.
<27 4> is spi for eSE(embedded Secure Element).
<85 4> is spi for fingerprint.

Remove excess reserved gpio regions.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 8a0d63bd594b..5948b401165c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -418,7 +418,8 @@ &usb_1_qmpphy {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
+	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
+			       <85 4>; /* SPI (fingerprint reader) */
 
 	sdc2_clk_state: sdc2-clk-state {
 		pins = "sdc2_clk";

-- 
2.39.2

