Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B33823D9E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 09:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED3010E30E;
	Thu,  4 Jan 2024 08:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB08010E30E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 08:42:14 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a28b1095064so26685266b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 00:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704357733; x=1704962533;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w6TTGghNZIM3DwJh+LEsX8daCCdA5ovV1xX1zOwS5+I=;
 b=RoqfvQCsKuhgSS1FH5Hz8TPLE6JBnnHxWULy9yZP6nrZdUzlgsklw0gR+nEq7aI0j2
 vS8wWhL09AoN8tGm6NIpjqsMIFkWUc1+wzuGIQF2d/QeQjWSP0uRyoNxV7PP+Dm15z/9
 h7vMuL4FIytoS7dlfh+KQzITH57fmcmubo8ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704357733; x=1704962533;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w6TTGghNZIM3DwJh+LEsX8daCCdA5ovV1xX1zOwS5+I=;
 b=miA1tvOecqll8fNmkufbdZuUSqzwnukxAUgW9gaiL07F8ExR9BbWCK5UQ/RNLlAPow
 OGJsvixJUQLUnf+jykHwqOK00R41AN73rn3fQlUitwqguxjYG0uvi6jRKcsvcM9TDrT+
 HHEj7JRfdeoGVhWB6vn2RMnXKHuTpMiRiSbva2qtSxPVCtGWHbTyxo3JUc9AIl46RFzY
 ciNvKHF7vWlVla4Yan+xIvwk7h33ETxM0lGdXZeMEPQ16x//KqdgaRLsA5DLBi1/eHF+
 r18LhGaVBaL+5pyYyH8tKZbTUH9J7ZGtLXTXQIPFCC6+JZ9t8fUC5dAzRW7LUtFNkjR8
 3mpQ==
X-Gm-Message-State: AOJu0Yw8fwSV05FCMJG5dS98IDRUgRLTz/F/64gvenVmT1ynde8tlfzM
 3aYdi52RHuPyyvvZc0f+PauMx9NmRk6BkA==
X-Google-Smtp-Source: AGHT+IFyrXaOSZ8giovYkCTuU9dk3yAf5TDiqjFF9nYGZb1tZAGuyWbchnGPaOePcQ+ciRaFdTnV/w==
X-Received: by 2002:a17:907:9009:b0:a28:c638:40a0 with SMTP id
 ay9-20020a170907900900b00a28c63840a0mr65840ejc.77.1704357733257; 
 Thu, 04 Jan 2024 00:42:13 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (net-93-150-255-34.cust.vodafonedsl.it. [93.150.255.34])
 by smtp.gmail.com with ESMTPSA id
 wh14-20020a170906fd0e00b00a233efe6aa7sm13495704ejb.51.2024.01.04.00.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 00:42:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/8] Add display support for stm32f769-disco board
Date: Thu,  4 Jan 2024 09:41:40 +0100
Message-ID: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Gregory CLEMENT <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>,
 Sean Nyekjaer <sean@geanix.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-amarula@amarulasolutions.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds display support for the stm32f769-disco board. It has been
tested on hardware revisions MB1225-B03 and MB1166-A09. This required
modifications to the nt35510 driver. As I do not have the Hydis HVA40WV1
display, it would be better if someone tested the driver in that
configuration.

Changes in v4:
- Put the "enum" list in alphabetical order

Changes in v3:
- Use "enum" to have less code changed

Changes in v2:
- Add Acked-by tag of Conor Dooley
- Add a dash in front of each "items:"
- Change the status of panel_backlight node to "disabled"
- Delete backlight property from panel0 node.
- Re-write the patch [7/8] "drm/panel: nt35510: refactor panel initialization"
  in the same style as the original driver in order to maintain the same
  structure.
- Re-write the patch [8/8] "drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK"
  in the same style as the original driver.

Dario Binacchi (8):
  dt-bindings: mfd: stm32f7: Add binding definition for DSI
  ARM: dts: stm32: add DSI support on stm32f769
  ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f769-disco
  ARM: dts: stm32: add display support on stm32f769-disco
  dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
  ARM: dts: add stm32f769-disco-mb1225-revb03-mb1166-reva09
  drm/panel: nt35510: move hardwired parameters to configuration
  drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK

 .../display/panel/novatek,nt35510.yaml        |   4 +-
 arch/arm/boot/dts/st/Makefile                 |   1 +
 ...f769-disco-mb1225-revb03-mb1166-reva09.dts |  18 +
 arch/arm/boot/dts/st/stm32f769-disco.dts      |  78 +++-
 arch/arm/boot/dts/st/stm32f769.dtsi           |  21 +
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 422 +++++++++++++++---
 include/dt-bindings/mfd/stm32f7-rcc.h         |   1 +
 7 files changed, 484 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
 create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi

-- 
2.43.0

