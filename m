Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DE290DD55
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 22:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE30610E7B0;
	Tue, 18 Jun 2024 20:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tou4doA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F39F10E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 13:59:49 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-57c778b5742so6371994a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 06:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719188; x=1719323988; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Adi2wWb7CQgdnxLc6JlMBQCMQ7TabQhjqNcj/v5iN0I=;
 b=Tou4doA5k3YBbSHFNt9yMeaRcHhfSbfpB74Av5O4EhmVD66JugeSJsprv8SUrBOV1O
 hseRskGKGhqpZ4hvwY8ihBgBD85iqkbBkdZ76JfOCLKJijvS/34dMcp61LcCLppKrwSs
 enrgoxxgqvJ0guRKbsHUnFNb+NiqllxTxHuK25d4myGf0nTiONPquMP5aPMMXgn6H6pu
 7jzsc2Z/9J2cm0IhjQT23b3GPyRA6H0YkSTGuDU398/NYeCQ7ShPsY/WJYS0rg0QhNVt
 kG7Fvy8P0Xz3jj2v+kkLOhVT+6hYaxMeDeYFGVkBJwv8iLCDRQNAHOgmddeAdMsU288S
 fHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719188; x=1719323988;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Adi2wWb7CQgdnxLc6JlMBQCMQ7TabQhjqNcj/v5iN0I=;
 b=RhZkQOTHgv6GMlE/7aAGtTzILc23YdW79tTCLocLg5Bv+5ife8zMs/TEUgKl4Fshxr
 xStCzry3J3LvUSI6ORCi8Ov1iF1OCuKgyPwPR2no+1ptYnS/JKbaJMk83yrmrVNuGHtO
 3dhkYOnnn2r0u4/t/b/XjxUwxS44AOQjS2q64TGGNXNhxc7loj+YQ1VWBP7e0azzI7/2
 AQlREyVKNPj3NVd3mDAV39C68WuWWBPUvDCnanM099BDpl7KQygJ5ofvLLQjKUs1bRCR
 a145L62gvGtsI2K9cDutd4Feos3obEKSjev6CJvl/jLE2iBXiO08nhKS5UhiEC0OX3zp
 pAyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWemKzrz6oRhJlQfWvk3oZaKaHZyN/euytHmvfF/OTTKN7UQknD6A9gIpg8JR5qrhYe8ZXC2VLxX3L0YDTMfUS4doFHnW5htxfaigJ7f+n1
X-Gm-Message-State: AOJu0YybK+DXj9K6h4SsjUAaTe2hTmKgh0s2yRoLGhP/CUqn+t+AfimH
 83gowDpc5JyzkIsjSNCWSNIs/nVQQMGT1GGKWd1Q4r4m4ShDt5ElDe9n3lf1
X-Google-Smtp-Source: AGHT+IHkXZgoTKxIUb0ylYKUXiHMUMsGLjdaUUwhyfeBvSUWkw++uYmoTYRWLAznXRQEGKmegPpZkA==
X-Received: by 2002:a05:6402:2c5:b0:57d:5e:83f0 with SMTP id
 4fb4d7f45d1cf-57d005e8481mr820906a12.14.1718719187201; 
 Tue, 18 Jun 2024 06:59:47 -0700 (PDT)
Received: from [127.0.1.1] (mm-167-232-122-178.mgts.dynamic.pppoe.byfly.by.
 [178.122.232.167]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm7731278a12.22.2024.06.18.06.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:59:46 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v3 00/23] This is continued work on Samsung S9(SM-9600)
 starqltechn
Date: Tue, 18 Jun 2024 16:59:34 +0300
Message-Id: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMaScWYC/x2N0QrCMAxFf2Xk2ULddA5/RWSkNVsDNc60E2Hs3
 w0+ngP33A0KKVOBa7OB0ocLv8SgOzQQE8pMjh/G0Pr25PvjxZWK+s6VYpKRpdKsWG0zrkupSvh
 0IQ79cPahnagDywQs5IKixGQhWXM2uShN/P3/3u77/gNgLEi3hwAAAA==
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
 Dzmitry Sankouski <dsankouski@gmail.com>, Rose Hudson <rose@krx.sh>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718719184; l=5095;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=NSipSLp2nG6EjiX/c5tUJTeTkiL6bf1l/S7iaC8WvW0=;
 b=Sr8pA2ujQFTHIDig3qhFg2f1KEeBbgU4VxItfHedbfa6oxlb7f4Sec7x5JgfHjY52G/css65m
 KY4otbWl+7dB0CpeN2Z/x/SuDr4cWH2saHT22U9tDUZGj+70EOppvtS
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
X-Mailman-Approved-At: Tue, 18 Jun 2024 20:22:02 +0000
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

Add support for new features:
- sound (headphones and mics only)
- gpu
- panel
- buttons
- MAX77705 MFD:
  - charger
  - fuelgauge
  - haptic
  - led

Changes in version 2:
- s2dos05 regulator:
  - hex to decimal in regulator values
  - fix compatible value
  - remove interrupt specific code, because it's
    empty in vendor kernel, and I cannot test it on
    available hardware anyway.

Changes in version 3:
Version 3 has significant changes:
- more drivers added
- s2dos05 driver converted to MFD
- disable crypto patch removed(disabled on distro level)
- dts framebuffer node along with related patches removed,
because panel driver added
- fix 'make O=.output_arm64 CHECK_DTBS=y qcom/sdm845-samsung-starqltechn.dtb'
errors, but it still complains on 'monitored-battery' and
'power-supplies' though I have 'power-supply.yaml' link in charger
and fuel gauge bindings.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Dzmitry Sankouski (23):
      power: supply: add undervoltage health status property
      gcc-sdm845: Add rates to the GP clocks
      dt-bindings: panel: add Samsung s6e3ha8
      dt-bindings: mfd: add maxim,max77705
      dt-bindings: input: add maxim,max77705-haptic
      dt-bindings: power: supply: add maxim,max77705 charger
      dt-bindings: power: supply: add maxim,max77705
      dt-bindings: led: add maxim,max77705-leds
      dt-bindings: mfd: add samsung,s2dos05
      dt-bindings: regulator: add samsung,s2dos05
      drm/panel: Add support for S6E3HA8 panel driver
      mfd: Add new driver for MAX77705 PMIC
      input: add max77705 haptic driver
      power: supply: max77705: Add charger driver for Maxim 77705
      power: supply: max77705: Add fuel gauge driver for Maxim 77705
      leds: max77705: Add LEDs support
      mfd: add s2dos series core driver
      regulator: add s2dos05 regulator support
      power: supply: s2dos05: Add fuel gauge driver for s2dos05
      arm64: dts: qcom: starqltechn: remove wifi
      arm64: dts: qcom: starqltechn: remove framebuffer
      arm64: dts: qcom: starqltechn: fix usb regulator mistake
      arm64: dts: qcom: starqltechn: add new features

 .../bindings/display/panel/samsung,s6e3ha8.yaml    |  76 ++
 .../devicetree/bindings/input/maxim,max77705.yaml  |  31 +
 .../devicetree/bindings/leds/maxim,max77705.yaml   |  45 ++
 .../devicetree/bindings/mfd/maxim,max77705.yaml    | 112 +++
 .../devicetree/bindings/mfd/samsung,s2dos05.yaml   |  89 +++
 .../power/supply/maxim,max77705-charger.yaml       |  30 +
 .../bindings/power/supply/maxim,max77705-fg.yaml   |  35 +
 .../bindings/regulator/samsung,s2dos05.yaml        |  36 +
 MAINTAINERS                                        |  15 +
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   | 607 +++++++++++++++-
 drivers/clk/qcom/gcc-sdm845.c                      |  14 +
 drivers/gpu/drm/panel/Kconfig                      |   7 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c      | 426 ++++++++++++
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/max77705-haptic.c               | 378 ++++++++++
 drivers/leds/Kconfig                               |   6 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-max77705.c                       | 166 +++++
 drivers/mfd/Kconfig                                |  25 +
 drivers/mfd/Makefile                               |   3 +
 drivers/mfd/max77705-core.c                        | 278 ++++++++
 drivers/mfd/max77705-irq.c                         | 299 ++++++++
 drivers/mfd/s2dos-core.c                           | 141 ++++
 drivers/power/supply/Kconfig                       |  21 +
 drivers/power/supply/Makefile                      |   3 +
 drivers/power/supply/max77705_charger.c            | 772 +++++++++++++++++++++
 drivers/power/supply/max77705_fuelgauge.c          | 624 +++++++++++++++++
 drivers/power/supply/s2dos05-fg.c                  | 427 ++++++++++++
 drivers/regulator/Kconfig                          |   8 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/s2dos05-regulator.c              | 362 ++++++++++
 include/linux/mfd/max77705-private.h               | 281 ++++++++
 include/linux/mfd/max77705.h                       |  20 +
 include/linux/mfd/max77705_charger.h               | 225 ++++++
 include/linux/mfd/s2dos05.h                        | 123 ++++
 include/linux/mfd/samsung/s2dos-core.h             |  21 +
 include/linux/mfd/samsung/s2dos05.h                | 115 +++
 include/linux/power/max77705_fuelgauge.h           | 107 +++
 include/linux/power_supply.h                       |   1 +
 41 files changed, 5927 insertions(+), 17 deletions(-)
---
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

